extends Node2D
class_name CancelButton
@onready var area_2d: Area2D = $Area2D

signal cancel_ram

func _ready() -> void:
    area_2d.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        cancel_ram.emit()   
