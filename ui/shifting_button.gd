extends Button



func _on_toggled(toggled_on: bool) -> void:
    if toggled_on:
        var tween : Tween = create_tween()
        tween.tween_property(self, 'position:x', -10, 0.5)
    else:
        var tween : Tween = create_tween()
        tween.tween_property(self, 'position:x', 0, 0.5)
