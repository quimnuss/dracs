extends Node2D

@export var tools_textures : Dictionary[String, Texture2D] = {
    Tool.ROSE_WHITE : preload("res://assets/tool_mouses/rose_white.png"),
    Tool.ROSE_RED : preload("res://assets/tool_mouses/rose_red.png"),
    Tool.ROSE_YELLOW : preload("res://assets/tool_mouses/rose_yellow.png"),
    Tool.ROSE_BLUE  : preload("res://assets/tool_mouses/rose_blue.png"),
    Tool.SCISSORS : preload("res://assets/tool_mouses/scissors.png"),
    Tool.SPRAY : preload("res://assets/tool_mouses/spray.png"),
    Tool.ERASER : preload("res://assets/tool_mouses/eraser.png"),
    Tool.HAND : preload("res://assets/tool_mouses/hand.png"),
    Tool.RIBBON_BLUE : preload("res://assets/tool_mouses/ribbonblue.png"),
    Tool.RIBBON_RED : preload("res://assets/tool_mouses/ribbonred.png"),
    Tool.RIBBON_SENYERA : preload("res://assets/tool_mouses/ribbonsenyera.png"),
    Tool.NONE : preload("res://assets/tool_mouses/hand.png"),
}

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
    sprite_2d.texture = tools_textures[Singleton.current_tool]
    Singleton.tool_changed.connect(_on_tool_changed)

func _process(delta: float) -> void:
    self.global_position = get_global_mouse_position()

func _on_tool_changed():
    var tool_texture : Texture2D = tools_textures[Singleton.current_tool]
    sprite_2d.texture = tool_texture
