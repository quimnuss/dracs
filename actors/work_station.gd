extends Node2D

@onready var vase_center: Marker2D = $VaseCenter

var current_ingredient : String

var roses : Array[Rose]


func custom_sort(rose_a, rose_b):
    return rose_a.position.x < rose_b.position.x

    
func get_sequence() -> Array[Color]:
    roses.sort_custom(custom_sort)
    var seq : Array[Color]
    for rose in roses:
        seq.append(rose.rose_type)
    return seq


func _on_vase_area_2d_input_event(viewport, event : InputEvent, shape_idx):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        var mouse_pos : Vector2 = get_global_mouse_position()
        var rose : Rose = Rose.Instantiate(current_ingredient)
        roses.append(rose)
        vase_center.add_child(rose)
        rose.global_position = mouse_pos
        var seq = get_sequence()
        Singleton.current_delivery.update_flowers(seq)
        prints('Rose sequence',seq)


func _on_shelf_ingredient_selected(new_ingredient: String) -> void:
    current_ingredient = new_ingredient
