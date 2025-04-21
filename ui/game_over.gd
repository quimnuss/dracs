extends Control

func _ready():
    Singleton.money_changed.connect(_on_money_changed)
    Singleton.global_approval_changed.connect(_on_global_approval_changed)

func _on_reobrir_button_pressed() -> void:
    var tween := create_tween()
    tween.tween_property(self, "modulate:a", 0, 1)
    await tween.finished
    Singleton.reset()
    get_tree().reload_current_scene()

func fade_in():
    self.modulate.a = 0
    var tween := create_tween()
    tween.tween_property(self, "modulate:a", 1, 1)
    self.visible = true
    await tween.finished

func _on_money_changed(_amount_increase):
    if Singleton.money == 0 and not self.visible:
        fade_in()

func _on_global_approval_changed():
    if Singleton.global_approval < 20 and not self.visible:
        fade_in()
