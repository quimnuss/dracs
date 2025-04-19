extends Control

@onready var grid_container: GridContainer = $GridContainer

static var tool_button_group : ButtonGroup = ButtonGroup.new()

func _ready() -> void:
    var childs := grid_container.get_children()
    for child in childs:
        if child is Button:
            child.button_group = tool_button_group
            child.pressed.connect(_on_tool_button_pressed.bind(child))

    

func _on_tool_button_pressed(button : Button):
    print(button.name)
    match button.name.to_lower():
        Tool.SCISSORS:
            Singleton.current_tool = Tool.SCISSORS
        Tool.SPRAY:
            Singleton.current_tool = Tool.SPRAY
        Tool.ERASER:
            Singleton.current_tool = Tool.ERASER
        Tool.HAND:
            Singleton.current_tool = Tool.HAND
        Tool.RIBBON_BLUE:
            Singleton.current_tool = Tool.RIBBON_BLUE
        Tool.RIBBON_RED:
            Singleton.current_tool = Tool.RIBBON_RED
        Tool.RIBBON_SENYERA:
            Singleton.current_tool = Tool.RIBBON_SENYERA
