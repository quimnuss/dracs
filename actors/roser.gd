extends Node2D


@onready var roser_sprite: Sprite2D = $RoserSprite
@onready var roses: Node2D = $Roses
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

var spawn_area : Rect2

const WATER_THRESHOLD = 1
var water_elapsed : float = 0
var watering : bool = false


func _ready() -> void:
    spawn_area = collision_shape_2d.shape.get_rect()
    print(spawn_area)


func spawn_rose():
    var pos : Vector2 = self.global_position + Vector2(
        randi_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
        randi_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
    )
    var rose_head : RoseHead = preload('res://actors/rose_head.tscn').instantiate()
    roses.add_child(rose_head)
    rose_head.global_position = pos
    
    
func _process(delta: float) -> void:
    if watering:
        if Singleton.current_tool == Tool.SPRAY:
            water_elapsed += delta
            if water_elapsed >= WATER_THRESHOLD:
                spawn_rose()
                water_elapsed = 0
    else:
        water_elapsed = 0        


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        watering = event.is_pressed()
        
