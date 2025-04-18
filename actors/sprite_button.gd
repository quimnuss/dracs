extends Node2D

@onready var area_2d: Area2D = $Area2D

@export_enum('vasepoly', 'vasered') var vase_type = 'vasepoly'

signal vase_changed(vase_type : String)

func _ready():
    area_2d.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        match vase_type:
            'vasepoly':
                vase_changed.emit(Tool.VASE_POLY)
            'vasered':
                vase_changed.emit(Tool.VASE_RED)
