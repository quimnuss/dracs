extends Button

@export_enum('moves_left', 'moves_right') var direction = 'moves_left'

func _on_toggled(toggled_on: bool) -> void:
    var shift : float = 10 if direction == 'moves_right' else -10
    if toggled_on:
        var tween : Tween = create_tween()
        tween.tween_property(self, 'position:x', shift, 0.5)
    else:
        var tween : Tween = create_tween()
        tween.tween_property(self, 'position:x', 0, 0.5)
