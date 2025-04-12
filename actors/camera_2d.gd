extends Camera2D

const HORIZONTAL_MOVEMENT = 1152

func go_right():
    self.global_position.x += HORIZONTAL_MOVEMENT
    self.global_position.x = clamp(self.global_position.x, self.limit_left + HORIZONTAL_MOVEMENT/2, self.limit_right - HORIZONTAL_MOVEMENT/2)

func go_left():
    self.global_position.x -= HORIZONTAL_MOVEMENT
    self.global_position.x = clamp(self.global_position.x, self.limit_left + HORIZONTAL_MOVEMENT/2, self.limit_right - HORIZONTAL_MOVEMENT/2)

func _process(delta: float) -> void:
    if Input.is_action_just_pressed('ui_right'):
        go_right()
    elif Input.is_action_just_pressed('ui_left'):
        go_left()
        
