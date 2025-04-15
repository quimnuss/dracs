extends Node2D
class_name Rose

var rose_type : String

@onready var start: Marker2D = $Add/Start
@onready var end: Marker2D = $Add/End
@onready var add: Node2D = $Add

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

@export var num_petals : int = 4

func _ready():
    for petal_num in range(num_petals):
        var petal_position : Vector2 = start.global_position + (end.global_position - start.global_position) * petal_num/num_petals
        var petal : Node2D = preload("res://actors/petal.tscn").instantiate()
        add.add_child(petal)
        petal.global_position = petal_position
        
        
        
