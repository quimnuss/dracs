extends Node2D
@onready var area_2d: Area2D = $Area2D

signal ship

func _ready() -> void:
    area_2d.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        ship.emit()        
