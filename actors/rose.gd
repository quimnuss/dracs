extends Node2D
class_name Rose

var rose_type : String

@onready var start: Marker2D = $Add/Start
@onready var end: Marker2D = $Add/End
@onready var add: Node2D = $Add
@onready var rose_head: Sprite2D = $RoseHead
@onready var rose_stem: Sprite2D = $RoseStem

static var rose_map : Dictionary = {
    'RoseWhite': Color.WHITE,
    'RoseRed': Color.RED,
    'RoseYellow': Color.YELLOW,
    'RoseBlue': Color.BLUE,
}

static func Instantiate(rose_type_ : String):
    var rose = preload("res://actors/rose.tscn").instantiate()            
    rose.modulate = rose_map.get(rose_type_, Color.WHITE)
    rose.rose_type = rose_type_
    return rose

@export var num_petals : int = 4

signal erased(rose : Rose)

@export var rose_heads : Array[Texture] = [
    preload("res://assets/roses/rosa1.png"),
    preload("res://assets/roses/rosa2.png"),
    preload("res://assets/roses/rosa3.png")
]
@export var rose_stems : Array[Texture] = [
    preload("res://assets/tijes/tija1.png"),
    preload("res://assets/tijes/tija2.png"),
    preload("res://assets/tijes/tija3.png")
]

func _ready():
    for petal_num in range(num_petals):
        var petal_position : Vector2 = start.global_position + (end.global_position - start.global_position) * petal_num/num_petals
        var petal : Node2D = preload("res://actors/petal.tscn").instantiate()
        add.add_child(petal)
        petal.global_position = petal_position
    rose_head.texture = rose_heads.pick_random()
    rose_stem.texture = rose_stems.pick_random()
    

func has_petals() -> bool:
    for petal in get_children():
        if petal is Petal and petal.rotten:
            return true
    return false


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        if Singleton.current_tool == Tool.ERASER:
            erased.emit(self)
            queue_free()
