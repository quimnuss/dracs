extends Camera2D

const HORIZONTAL_MOVEMENT = 1152



func _process(delta: float) -> void:
    if Input.is_action_just_pressed('ui_right'):
        self.global_position.x += HORIZONTAL_MOVEMENT
    elif Input.is_action_just_pressed('ui_left'):
        self.global_position.x -= HORIZONTAL_MOVEMENT
        
