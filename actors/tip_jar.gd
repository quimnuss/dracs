extends Marker2D

func _ready():
    EventBus.delivered.connect(_on_delivery)
    
func _on_delivery(order_delivery : OrderDelivery):
    #rating goes 0-100
    var rating := order_delivery.rating
    var tip := 5 + 10 * rating/100.0
    var number := preload("res://actors/number_up_label.tscn").instantiate()
    number.value = tip
    add_child(number)
    number.position = Vector2(0,0)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept"):
        print('fake delivery!')
        var order : Order = Orders.ordername_to_order(Singleton.current_order)
        var order_delivery := OrderDelivery.Instantiate(order, order.flowers, 1, Color.RED, Singleton.order_start_time)
        _on_delivery(order_delivery)
        
    
