extends Node2D

@onready var tutorial_comanda: Node2D = $TutorialComanda

func _ready() -> void:
    EventBus.order_accepted.connect(tutorial_comanda._on_button_pressed)


func _on_help_button_pressed() -> void:
    self.visible = not self.visible
