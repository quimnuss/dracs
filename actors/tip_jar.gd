extends Marker2D

@export var BASE_TIP : float = 2.0
@export var MAX_VARIABLE_TIP : float = 20.0

func _ready():
    EventBus.delivered.connect(_on_delivery)
    
func _on_delivery(order_delivery : OrderDelivery):
    #rating goes 0-100
    var rating := order_delivery.rating
    var tip := BASE_TIP + MAX_VARIABLE_TIP * rating/100.0
    await get_tree().create_timer(1).timeout
    Singleton.money += tip
    var number := preload("res://actors/number_up_label.tscn").instantiate()
    number.value = tip
    add_child(number)
    number.position = Vector2(0,0)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept") and Singleton.current_order:
        print('fake delivery!')
        var order : Order = Orders.ordername_to_order(Singleton.current_order)
        var order_delivery := OrderDelivery.Instantiate(order, order.flowers, 1, Color.RED, Singleton.order_start_time, true)
        _on_delivery(order_delivery)
        await get_tree().create_timer(1).timeout
        Singleton.cash_delivery(order_delivery)
        Singleton.next_order()
        
    
