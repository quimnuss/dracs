extends Node2D
class_name Rose

var rose_type : String

static var rose_map : Dictionary = {
    'RoseWhite': Color.WHITE,
    'RoseRed': Color.RED,
    'RoseYellow': Color.YELLOW,
    'RoseBlue': Color.BLUE,
}

static func Instantiate(rose_type : String):
    var rose = preload("res://actors/rose.tscn").instantiate()            
    rose.modulate = rose_map.get(rose_type, Color.WHITE)
    rose.rose_type = rose_type
    return rose
