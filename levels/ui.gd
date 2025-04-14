extends CanvasLayer
@onready var order_label: Label = %OrderLabel

func _ready():
    Singleton.order_changed.connect(_on_order_changed)
    EventBus.order_accepted.connect(_on_order_changed)

func _on_order_changed():
    var new_order_name := Singleton.current_order
    if new_order_name and new_order_name != '':
        var order := Orders.ordername_to_order(new_order_name)
        order_label.text = order.order_short
        order_label.visible = true
    else:
        order_label.visible = false
    
