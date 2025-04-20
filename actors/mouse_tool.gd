extends Node2D

@export var tools_textures : Dictionary[String, Texture2D] = {
    Tool.ROSE_WHITE : preload("res://assets/tool_mouses/rose_white.png"),
    Tool.ROSE_RED : preload("res://assets/tool_mouses/rose_red.png"),
    Tool.ROSE_YELLOW : preload("res://assets/tool_mouses/rose_yellow.png"),
    Tool.ROSE_BLUE  : preload("res://assets/tool_mouses/rose_blue.png"),
    Tool.SCISSORS : preload("res://assets/tool_mouses/scissors.png"),
    Tool.SPRAY : preload("res://assets/tool_mouses/spray.png"),
    Tool.ERASER : preload("res://assets/tool_mouses/eraser.png"),
    Tool.HAND : preload("res://assets/tool_mouses/hand.png"),
    Tool.RIBBON_BLUE : preload("res://assets/tool_mouses/ribbonblue.png"),
    Tool.RIBBON_RED : preload("res://assets/tool_mouses/ribbonred.png"),
    Tool.RIBBON_SENYERA : preload("res://assets/tool_mouses/ribbonsenyera.png"),
    Tool.NONE : preload("res://assets/tool_mouses/hand.png"),
}

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var tool_animated: AnimatedSprite2D = $ToolAnimated

func _ready():
    Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
    sprite_2d.texture = tools_textures[Singleton.current_tool]
    Singleton.tool_changed.connect(_on_tool_changed)

func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and (event.is_pressed() or event.is_released()):
        if event.is_pressed():
            if Singleton.current_tool == Tool.SPRAY:
                tool_animated.visible = true
                animated_sprite_2d.play("default")
                tool_animated.play("spray")
                sprite_2d.visible = false
            elif Singleton.current_tool == Tool.SCISSORS:
                tool_animated.visible = true
                tool_animated.play("scissors")
                sprite_2d.visible = false
        elif event.is_released() or Singleton.current_tool != Tool.SPRAY:
            sprite_2d.visible = true
            tool_animated.stop()
            tool_animated.visible = false
            if animated_sprite_2d.is_playing():
                # too race conditiony
                #await animated_sprite_2d.animation_looped
                animated_sprite_2d.stop()
            
func _process(_delta: float) -> void:
    self.global_position = get_global_mouse_position()

func _on_tool_changed():
    var tool_texture : Texture2D = tools_textures[Singleton.current_tool]
    sprite_2d.texture = tool_texture
    tool_animated.stop()
    tool_animated.visible = false
    if Singleton.current_tool != Tool.SPRAY and animated_sprite_2d.is_playing():
       animated_sprite_2d.stop()
        
