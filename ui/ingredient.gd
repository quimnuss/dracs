extends Button

class_name IngredientButton
@onready var texture_rect: TextureRect = $TextureRect

@export_enum('RoseWhite', 'RoseRed', 'RoseYellow', 'RoseBlue') var rose_type : String = 'RoseBlue'

signal ingredient_selected(new_ingredient : String)

func _ready():
    self.pressed.connect(_on_pressed)
    self.toggled.connect(_on_toggled)
    self.add_to_group('ingredient')

func _on_toggled(toggled_on : bool):
    if toggled_on:
        ingredient_selected.emit(rose_type)

func _on_pressed():
    ingredient_selected.emit(rose_type)


func _on_resized() -> void:
    #texture_rect.size = self.size
    pass
