extends Control

var current_ingredient : String = ""

signal ingredient_selected(new_ingredient : String)

func _ready():
    for ingredient in get_tree().get_nodes_in_group('ingredient'):
        ingredient.ingredient_selected.connect(_on_ingredient_selected)

func _on_ingredient_selected(new_ingredient: String) -> void:
    if new_ingredient != current_ingredient:
        current_ingredient = new_ingredient
        ingredient_selected.emit(new_ingredient)
