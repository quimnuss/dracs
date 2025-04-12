extends Control

@onready var grid_container: GridContainer = $GridContainer

var button_group : ButtonGroup = ButtonGroup.new()

func _ready() -> void:
    var childs := grid_container.get_children()
    for child in childs:
        if child is Button:
            child.button_group = button_group
