extends TabContainer

@export var first_icon : Texture2D
@export var second_icon : Texture2D

func _ready() -> void:
    self.size
    self.set_tab_icon(0, first_icon)
    self.set_tab_title(0, '')
    self.set_tab_icon(1, second_icon)
    self.set_tab_title(1, '')
