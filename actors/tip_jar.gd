extends Marker2D

@export var BASE_TIP : int = 2
@export var MAX_VARIABLE_TIP : int = 15

func _ready():
    EventBus.delivered.connect(_on_delivery)
    
func _on_delivery(order_delivery : OrderDelivery):
    #rating goes 0-100
    if order_delivery.rating == 0:
        Singleton.global_approval = clamp(0.8*Singleton.global_approval, 0, 100)
        return
    
    Singleton.score += order_delivery.rating
    Singleton.money += order_delivery.order.price
    
    var rating := order_delivery.rating
    var tip : float = BASE_TIP + MAX_VARIABLE_TIP * rating/100.0
    await get_tree().create_timer(1).timeout
    Singleton.money += ceil(tip)
    var number := preload("res://actors/number_up_label.tscn").instantiate()
    number.value = ceil(tip)
    add_child(number)
    number.position = Vector2(0,0)
    
    Singleton.global_approval = clamp(0.8*Singleton.global_approval + 0.2*1.3*Singleton.order_approval, 0, 100)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept") and Singleton.current_order and OS.is_debug_build():
        print('fake delivery!')
        var order : Order = Orders.ordername_to_order(Singleton.current_order)
        var order_delivery := OrderDelivery.Instantiate(order, order.flowers, 1, Color.BLACK, Singleton.order_start_time, true)
        _on_delivery(order_delivery)
        await get_tree().create_timer(1).timeout
        Singleton.cash_delivery(order_delivery)
        Singleton.next_order()
        
    
