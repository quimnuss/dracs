extends Node2D
class_name Ribbon

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready():
    match Singleton.current_tool:
        Tool.RIBBON_BLUE:
            self.modulate = Color.LIGHT_BLUE
        Tool.RIBBON_RED:
            self.modulate = Color.INDIAN_RED
        Tool.RIBBON_SENYERA:
            animated_sprite_2d.animation = 'senyera'
