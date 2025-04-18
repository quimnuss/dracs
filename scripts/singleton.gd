extends Node

@export var current_order : String = 'senyera' : 
    set(new_order):
        if current_order != new_order:
            current_order = new_order
            order_changed.emit()

var order_start_time : int = Time.get_ticks_msec()

@export_enum('welcome', 'desk', 'atelier') var current_screen = 'welcome' : 
    set(new_screen):
        current_screen = new_screen
        if current_screen != new_screen:
            at_screen.emit(current_screen)

var cashed_deliveries : Array[OrderDelivery]

var current_tool : String = Tool.NONE: 
    set(new_tool):
        if current_tool != new_tool:
            current_tool = new_tool
            tool_changed.emit()

var score : float = 0
var money : int = 100: 
    set(new_money):
        if money != new_money:
            var delta_money : float = new_money - money
            money = clamp(new_money, 0, 100000000)
            money_changed.emit(delta_money)

var order_approval : int = 100
var global_approval : int = 50

signal at_screen(screen_name : String)
signal order_changed
signal money_changed(amount_increase : float)
signal tool_changed


func _ready() -> void:
    current_order = Orders.orders_dict.keys().pick_random()


func next_order():
    current_order = Orders.orders_dict.keys().pick_random()
    order_changed.emit()


func cash_delivery(delivery : OrderDelivery):
    cashed_deliveries.append(delivery)
    
    score += delivery.rating
    money += delivery.order.price
    current_order = ''


func _process(_delta: float) -> void:
    if Input.is_action_just_pressed('next_order'):
        next_order()
