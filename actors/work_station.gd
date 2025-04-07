extends Node2D

@onready var vase_center: Marker2D = $VaseCenter

var current_ingredient : String

func _on_vase_area_2d_input_event(viewport, event : InputEvent, shape_idx):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        var mouse_pos : Vector2 = get_global_mouse_position()
        var rose = preload("res://actors/rose.tscn").instantiate()
        vase_center.add_child(rose)
        rose.global_position = mouse_pos


func _on_shelf_ingredient_selected(new_ingredient: String) -> void:
    current_ingredient = new_ingredient
