extends Control

func _ready():
    Singleton.money_changed.connect(_on_money_changed)

func _on_reobrir_button_pressed() -> void:
    var tween := create_tween()
    tween.tween_property(self, "modulate:a", 0, 1)
    await tween.finished
    get_tree().reload_current_scene()

func fade_in():
    self.modulate.a = 0
    var tween := create_tween()
    tween.tween_property(self, "modulate:a", 1, 1)
    self.visible = true
    await tween.finished

func _on_money_changed(amount_increase):
    if Singleton.money >= 1000:
        fade_in()

func _on_continue_button_2_pressed() -> void:
    var tween := create_tween()
    tween.tween_property(self, "modulate:a", 0, 1)
    await tween.finished
    self.visible = false
    self.queue_free()
