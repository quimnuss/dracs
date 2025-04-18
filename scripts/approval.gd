extends Node

var approval_time_left : float = 100.0

func _ready() -> void:
    EventBus.order_accepted.connect(_on_order_accepted)
    EventBus.shipped.connect(_on_shipped)
    set_process(false)


func _on_order_accepted():
    approval_time_left = 100
    set_process(true)

func _on_shipped(_ram : RamActor):
    print('approval stopped due to ship')
    set_process(false)

func _process(delta: float) -> void:
    approval_time_left -= delta
    Singleton.order_approval = clamp(approval_time_left, 0, 100)
