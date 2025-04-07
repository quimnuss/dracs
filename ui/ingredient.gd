extends Button

class_name IngredientButton

@export_enum('RoseWhite') var rose : String

signal ingredient_selected(String)

func _ready():
    self.add_to_group('Ingredient')

func _on_toggled(toggled_on : bool):
    if toggled_on:
        ingredient_selected.emit(rose)
