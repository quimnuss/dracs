extends CanvasLayer

@onready var control: Control = $Control

func _ready() -> void:
    self.visible = true


func _on_button_pressed() -> void:
    var tween : Tween = create_tween()
    tween.tween_property(control, 'modulate:a',0, 2)
    tween.tween_callback(queue_free)
