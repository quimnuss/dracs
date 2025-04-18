extends Node2D
class_name Petal

@onready var petal_sprite : Sprite2D = $Pivot/PetalSprite
@export var petals : Array[Texture2D]
@onready var pivot: Node2D = $Pivot

var is_cut : bool = false

var shift_x : float

func _ready() -> void:
    petal_sprite.texture = petals.pick_random()
    var flipped : bool =  bool(randi() % 2)
    petal_sprite.flip_h = flipped
    # TODO having the transform affect the position is not ideal
    pivot.position.x = petal_sprite.scale.x * petal_sprite.texture.get_width()*(-0.5 if flipped else 0.5)
    # petal_sprite.offset.x = petal_sprite.texture.get_width()*(-0.5 if flipped else 0.5)

func fall_like_leaf():
    var duration = 3.0
    var fall_distance = 300
    var sway_distance = 50
    var rot_angle = 30

    var tween_fall : Tween = create_tween()
    # Fall straight down
    tween_fall.tween_property(self, "position:y", position.y + fall_distance, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
    tween_fall.parallel().tween_property(self, 'modulate:a', 0, duration)
    tween_fall.tween_callback(queue_free).set_delay(1)

    var tween_sway : Tween = create_tween()
    # Sway left and right with chained tweens (approximate wave)
    tween_sway.tween_property(self, "position:x", position.x + sway_distance, duration / 4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
    tween_sway.tween_property(self, "position:x", position.x - sway_distance, duration / 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
    tween_sway.tween_property(self, "position:x", position.x, duration / 4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

    # Rotate back and forth while falling
    var tween_wave : Tween = create_tween()
    tween_wave.tween_property(self, "rotation_degrees", rot_angle, duration / 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
    tween_wave.tween_property(self, "rotation_degrees", -rot_angle, duration / 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
    tween_wave.tween_property(self, "rotation_degrees", 0, duration / 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func prune():
    fall_like_leaf()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        if Singleton.current_tool == Tool.SCISSORS:
            is_cut = true
            prune()
