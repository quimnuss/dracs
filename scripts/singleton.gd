extends Node

@export var current_order : String = 'senyera'

var order_start_time : int = Time.get_ticks_msec()

@export_enum('welcome', 'desk', 'atelier') var current_screen = 'welcome' : 
    set(new_screen):
        current_screen = new_screen
        if current_screen != new_screen:
            at_screen.emit(current_screen)

var cashed_deliveries : Array[OrderDelivery]

var current_tool : String = Tool.NONE

var score : float = 0
var money : int = 100

signal at_screen(screen_name : String)
signal order_changed
signal delivery_changed


func _ready() -> void:
    current_order = Orders.orders_dict.keys().pick_random()


func update_order():
    current_order = Orders.orders_dict.keys().pick_random()
    order_changed.emit()


func cash_delivery(delivery : OrderDelivery):
    cashed_deliveries.append(delivery)
    # get money
    # get score or something
    score += delivery.rating
    money += delivery.order.price


func _process(delta: float) -> void:
    if Input.is_action_just_pressed('next_order'):
        update_order()
