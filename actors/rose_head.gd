extends Node2D
class_name RoseHead

var roseheads_textures : Array[Texture2D] = [
    preload("res://assets/roses/rosa1.png"),
    preload("res://assets/roses/rosa2.png"),
    preload("res://assets/roses/rosa3.png"),
]

@onready var rose_head_sprite: Sprite2D = $RoseHeadSprite

var rose_type : String = Rose.rose_map.keys()[0]


func _ready() -> void:
    rose_type = Rose.rose_map.keys().pick_random()
    rose_head_sprite.modulate = Rose.rose_map[rose_type]


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        if Singleton.current_tool in [Tool.SCISSORS, Tool.HAND]:
            match rose_type: 
                'RoseWhite':
                    Singleton.current_tool = Tool.ROSE_WHITE
                'RoseRed':
                    Singleton.current_tool = Tool.ROSE_RED
                'RoseYellow':
                    Singleton.current_tool = Tool.ROSE_YELLOW
                'RoseBlue':
                    Singleton.current_tool = Tool.ROSE_BLUE
