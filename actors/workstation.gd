extends Node

@onready var workstation_left: Marker2D = $WorkstationLeft
@onready var workstation_right: Marker2D = $WorkstationRight


func _on_vase_changed(_vase_type: String) -> void:
    #TODO fix the ram spawning connection to the shelf
    var shelf := $"../TopLeftControl/Shelf"
    if workstation_left.get_child_count() == 0:
        var ram : RamActor = preload("res://actors/ram_actor.tscn").instantiate()
        workstation_left.add_child(ram)
    elif workstation_right.get_child_count() == 0:
        var ram : RamActor = preload("res://actors/ram_actor.tscn").instantiate()
        workstation_right.add_child(ram)
    else:
        prints('No workstations are free')
