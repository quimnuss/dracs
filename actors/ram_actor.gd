extends Node2D
class_name RamActor

@onready var vase_center: Marker2D = %VaseCenter
@onready var ship: Node2D = $Ship
@onready var vase_area_2d: Area2D = $VaseArea2D
@onready var grab_collision_shape_2d: CollisionShape2D = $GrabArea2D/GrabCollisionShape2D
@onready var cancel: CancelButton = $Cancel
@onready var ship_it_deliver: Sprite2D = $ShipItDeliver
@onready var ram: Node2D = %FrontRamSprites

var roses : Array[Rose]
var ribbon : Color = Color.BLACK

var delivered : bool = false

const ROSE_PRICE : int = 3
const RIBBON_PRICE : int = 2

func _ready():
    ship.ship.connect(_on_ship)
    add_to_group('rams')
    cancel.cancel_ram.connect(_on_cancel)


func _on_cancel():
    queue_free()


func _on_ship():
    ship.queue_free()
    vase_area_2d.queue_free()
    grab_collision_shape_2d.disabled = false
    Singleton.current_tool = Tool.HAND
    ram.modulate.a = 1
    EventBus.shipped.emit(self)
    

static func custom_sort(rose_a, rose_b):
    return rose_a.position.x < rose_b.position.x

    
static func get_sequence_names(roses_array : Array[Rose]) -> Array[String]:
    roses_array.sort_custom(custom_sort)
    var seq : Array[String]
    for rose in roses_array:
        seq.append(rose.rose_type)
    return seq


static func get_sequence_colors(roses_array : Array[Rose]) -> Array[Color]:
    roses_array.sort_custom(custom_sort)
    var seq : Array[Color]
    for rose in roses_array:
        seq.append(rose.rose_map[rose.rose_type])
    return seq


func _on_vase_area_2d_input_event(_viewport : Node, event : InputEvent, _shape_idx : int):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        if Singleton.current_tool.begins_with('Rose'):
            var mouse_pos : Vector2 = get_global_mouse_position()
            var rose : Rose = Rose.Instantiate(Singleton.current_tool)
            roses.append(rose)
            rose.erased.connect(_on_rose_erased)
            vase_center.add_child(rose)
            rose.global_position = mouse_pos
            Singleton.money -= ROSE_PRICE
            var seq = get_sequence_names(roses)
            var seq_colors = get_sequence_colors(roses)
            #Singleton.current_delivery.update_flowers(seq)
            prints('Rose sequence',seq, seq_colors)
        elif Singleton.current_tool.begins_with('ribbon'):
            var mouse_pos : Vector2 = get_global_mouse_position()
            var ribbon_actor : Ribbon = preload("res://actors/ribbon.tscn").instantiate()
            self.add_child(ribbon_actor)
            ribbon_actor.global_position = mouse_pos
            ribbon = Ribbon.tool_to_ribbon_color()
            Singleton.money -= RIBBON_PRICE
            

func _on_rose_erased(rose : Rose):
    roses.erase(rose)


func rose_has_petals(rose : Rose) -> bool:
    return rose.has_petals()


func ram_has_petals():
    return roses.any(rose_has_petals)


func deliver():
    var paper = 1
    var order : Order = Orders.ordername_to_order(Singleton.current_order)
    var has_petals : bool = ram_has_petals()
    var order_delivery = OrderDelivery.Instantiate(order, get_sequence_colors(roses), paper, ribbon, Singleton.order_start_time, has_petals)
    delivered = true
    Singleton.cash_delivery(order_delivery)
    EventBus.delivered.emit(order_delivery)
    self.queue_free()
    

func _on_grab_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if not delivered:
        if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
            deliver()


func _on_grab_area_2d_mouse_entered() -> void:
    ship_it_deliver.visible = true


func _on_grab_area_2d_mouse_exited() -> void:
    ship_it_deliver.visible = false
