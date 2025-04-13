extends Node2D

@onready var desk_marker: Marker2D = $DeskMarker

func _ready():
    EventBus.ship.connect(_on_ship)

func _on_ship(ram_actor : RamActor):
    ram_actor.reparent(desk_marker)
    return
