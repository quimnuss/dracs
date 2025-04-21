extends Node2D
class_name Ribbon

@onready var sprite_2d: Sprite2D = $Sprite2D

var ribbons : Dictionary[String, Texture2D] = {
    Tool.RIBBON_BLUE : preload("res://assets/ribbonblue.png"),
    Tool.RIBBON_RED : preload("res://assets/ribbonred.png"),
    Tool.RIBBON_SENYERA : preload("res://assets/ribbonsenyera.png"),
}

static func tool_to_ribbon_color() -> Color:
    match Singleton.current_tool:
        Tool.RIBBON_BLUE:
            return Color.BLUE
        Tool.RIBBON_RED:
            return Color.RED
        Tool.RIBBON_SENYERA:
            return Color.WHITE
    return Color.BLACK

func _ready():
    sprite_2d.texture = ribbons.get(Singleton.current_tool, ribbons[Tool.RIBBON_SENYERA])
