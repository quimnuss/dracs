extends Control

var current_ingredient : String = ""

signal ingredient_selected(new_ingredient : String)

func _ready():
    for ingredient in get_tree().get_nodes_in_group('ingredient'):
        ingredient.ingredient_selected.connect(_on_ingredient_selected)

func _on_ingredient_selected(new_ingredient: String) -> void:
    if current_ingredient != new_ingredient:
        current_ingredient = new_ingredient
        ingredient_selected.emit(new_ingredient)

    if Singleton.current_tool != new_ingredient:
        if(Tool.tools.has(new_ingredient)):
            Singleton.current_tool = new_ingredient
