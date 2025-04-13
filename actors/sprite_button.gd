extends Node2D

@onready var area_2d: Area2D = $Area2D

@export_enum('vasepoly', 'vasered') var vase_type = 'vasepoly'

signal vase_change

func _ready():
    area_2d.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    match vase_type:
        'vasepoly':
            vase_change.emit(Tool.VASE_POLY)
        'vasered':
            vase_change.emit(Tool.VASE_RED)
