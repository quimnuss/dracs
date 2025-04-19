extends Node2D

@export var tools_textures : Array[Texture] = [
    preload("res://assets/hand.png")
]

func _ready():
    Input.set_custom_mouse_cursor(tools_textures[0], Input.CursorShape.CURSOR_ARROW, Vector2(30,30))
