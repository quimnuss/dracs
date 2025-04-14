extends CanvasLayer
@onready var order_label: Label = %OrderLabel
@onready var money_label: Label = %MoneyLabel

func _ready():
    Singleton.order_changed.connect(_on_order_changed)
    EventBus.order_accepted.connect(_on_order_changed)
    Singleton.money_changed.connect(_on_money_changed)

func _on_order_changed():
    var new_order_name := Singleton.current_order
    if new_order_name and new_order_name != '':
        var order := Orders.ordername_to_order(new_order_name)
        order_label.text = order.order_short
        order_label.visible = true
    else:
        order_label.visible = false
    
func _on_money_changed(amount_increase : float):
    money_label.text = str(Singleton.money)
    var number := preload('res://actors/number_up_label.tscn').instantiate()
    number.value = amount_increase
    money_label.add_child(number)
    number.position = Vector2.ZERO
