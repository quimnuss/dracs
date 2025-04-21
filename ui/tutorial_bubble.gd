extends Node2D

@onready var anchor: Node2D = $Anchor

@export_enum('LEFT','RIGHT','TOP','DOWN') var point_direction := 'LEFT'

func _ready() -> void:
    add_to_group('tutorial')
    var shift : Vector2 = Vector2.LEFT
    match point_direction:
        'LEFT':
            shift = Vector2.RIGHT
        'RIGHT':
            shift = Vector2.LEFT
            
            
    var tween : Tween = create_tween().set_loops()
    tween.tween_property(anchor, 'position',50*shift,1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BOUNCE)
    tween.tween_property(anchor, 'position',Vector2.ZERO,1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)


func _on_button_pressed() -> void:
    self.visible = false


func _on_panel_container_gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        self.visible = false
