extends CanvasLayer

@onready var control: Control = $Control

func _ready() -> void:
    var tween : Tween = create_tween()
    tween.tween_property(control, 'modulate:a',0, 2).set_delay(3)
    tween.tween_callback(queue_free)
