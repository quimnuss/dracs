extends Node2D
class_name RamActor

@onready var vase_center: Marker2D = $VaseCenter
@onready var ship: Node2D = $Ship
@onready var vase_area_2d: Area2D = $VaseArea2D
@onready var grab_collision_shape_2d: CollisionShape2D = $GrabArea2D/GrabCollisionShape2D
@onready var cancel: CancelButton = $Cancel

var current_ingredient : String

var roses : Array[Rose]

var order_delivery : OrderDelivery

var delivered : bool = false

const ROSE_PRICE : float = 3.0


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


func _on_vase_area_2d_input_event(viewport, event : InputEvent, shape_idx):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        if current_ingredient and current_ingredient != '' and Singleton.current_tool.begins_with('Rose'):
            var mouse_pos : Vector2 = get_global_mouse_position()
            var rose : Rose = Rose.Instantiate(current_ingredient)
            roses.append(rose)
            rose.erased.connect(_on_rose_erased)
            vase_center.add_child(rose)
            rose.global_position = mouse_pos
            Singleton.money -= ROSE_PRICE
            var seq = get_sequence_names(roses)
            var seq_colors = get_sequence_colors(roses)
            #Singleton.current_delivery.update_flowers(seq)
            prints('Rose sequence',seq, seq_colors)


func _on_rose_erased(rose : Rose):
    roses.erase(rose)


func _on_shelf_ingredient_selected(new_ingredient: String) -> void:
    current_ingredient = new_ingredient


func deliver():
    var paper = 1
    var ribbon = Color.RED
    var order : Order = Orders.ordername_to_order(Singleton.current_order)
    var order_delivery = OrderDelivery.Instantiate(order, get_sequence_colors(roses), paper, ribbon, Singleton.order_start_time)
    delivered = true
    Singleton.cash_delivery(order_delivery)
    EventBus.delivered.emit(order_delivery)
    self.queue_free()
    

func _on_grab_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if not delivered:
        if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
            deliver()
