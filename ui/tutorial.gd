extends Node2D

@onready var tutorial_comanda: Node2D = $TutorialComanda

func _ready() -> void:
    EventBus.order_accepted.connect(tutorial_comanda._on_button_pressed)



func _on_help_button_toggled(toggled_on: bool) -> void:
    if toggled_on:
        get_tree().call_group('tutorial','set_visible', true)
        self.visible = true
    else:
        self.visible = false
