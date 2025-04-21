extends Camera2D

@export_enum('desk', 'atelier') var start_screen = 'desk'


const SCREEN_SIZE_X = 1152


func _ready():
    match start_screen:
        'desk':
            self.global_position.x -= SCREEN_SIZE_X
        'atelier':
            self.global_position.x += 0

    Singleton.current_screen = start_screen
    EventBus.order_accepted.connect(_on_order_accepted)
    EventBus.shipped.connect(_on_shipped)
        
func go_right():
    self.global_position.x += SCREEN_SIZE_X
    self.global_position.x = clamp(self.global_position.x, self.limit_left + int(SCREEN_SIZE_X/2.0), self.limit_right - int(SCREEN_SIZE_X/2.0))
    match Singleton.current_screen:
        'desk':
            Singleton.current_screen = 'atelier'

func go_left():
    self.global_position.x -= SCREEN_SIZE_X
    self.global_position.x = clamp(self.global_position.x, self.limit_left + int(SCREEN_SIZE_X/2.0), self.limit_right - int(SCREEN_SIZE_X/2.0))
    match Singleton.current_screen:
        'atelier':
            Singleton.current_screen = 'desk'


func _process(_delta: float) -> void:
    if Input.is_action_just_pressed('ui_right') and OS.is_debug_build():
        go_right()
    elif Input.is_action_just_pressed('ui_left') and OS.is_debug_build():
        go_left()

func _on_order_accepted():
    if Singleton.current_screen == 'desk':
        go_right()

func _on_shipped(_ram : RamActor):
    if Singleton.current_screen == 'atelier':
        go_left()
