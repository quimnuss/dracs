extends Control

func _ready():
    for ingredient in get_tree().get_nodes_in_group('Ingredient'):
        ingredient.ingredient_selected.connect(_on_ingredient_selected)
        
func _on_ingredient_selected():
    pass
