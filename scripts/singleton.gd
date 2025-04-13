extends Node

@export var current_order : String = 'senyera'

@export_enum('welcome', 'desk', 'atelier') var current_screen = 'welcome' : 
    set(new_screen):
        current_screen = new_screen
        if current_screen != new_screen:
            at_screen.emit(current_screen)

signal at_screen(screen_name : String)

func _ready() -> void:
    current_order = Orders.orders_dict.keys().pick_random()
