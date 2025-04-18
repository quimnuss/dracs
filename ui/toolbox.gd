extends Control

@onready var tool_container: GridContainer = $TabContainer/ToolContainer
@onready var ribbon_container: GridContainer = $TabContainer/RibbonContainer
@onready var tab_container: TabContainer = $TabContainer

var tool_button_group : ButtonGroup = ButtonGroup.new()

func _ready() -> void:
    var childs := tool_container.get_children()
    for child in childs:
        if child is Button:
            child.button_group = tool_button_group
            child.pressed.connect(_on_tool_button_pressed.bind(child))
    childs = ribbon_container.get_children()
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
    
