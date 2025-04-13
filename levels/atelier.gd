extends Node2D

@onready var desk_marker: Marker2D = $DeskMarker
@onready var shelf: Control = $TopLeftControl/Shelf

func _ready():
    EventBus.shipped.connect(_on_shipped)
    for ram in get_tree().get_nodes_in_group('rams'):
        var ram_a : RamActor = ram as RamActor
        if ram_a:
            shelf.ingredient_selected.connect(ram_a._on_shelf_ingredient_selected)

func _on_shipped(ram_actor : RamActor):
    ram_actor.reparent(desk_marker)
    ram_actor.position = Vector2.ZERO
    return
