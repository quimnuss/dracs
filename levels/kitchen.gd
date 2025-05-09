extends Node2D

@onready var order_text: RichTextLabel = %OrderText
@onready var dialog_bubble: Control = $DialogBubble
@onready var customer: Sprite2D = $CustomerAnchor/Customer
@onready var accept: Button = %Accept

@export var customers : Array[Texture] = []

var typing_speed = 1


func _ready():
    Singleton.order_changed.connect(_on_order_changed)
    EventBus.delivered.connect(_on_order_delivered)


func update_order():
    if Singleton.current_order:
        var current_order : Order = Orders.ordername_to_order(Singleton.current_order)
        update_text(current_order.order_long)
    else:
        update_text('')


func update_text(new_text : String):
    order_text.text = new_text
    var typing_tween : Tween = get_tree().create_tween()
    typing_tween.tween_property(order_text, "visible_characters", order_text.get_total_character_count(), typing_speed).from(0)
    dialog_bubble.visible = true


func _on_order_changed():
    update_order()


func _on_accept_pressed() -> void:
    EventBus.order_accepted.emit()
    dialog_bubble.visible = false


func pop_out_tween():
    var tween : Tween = create_tween()
    tween.tween_property(customer, 'position:y', 500, 0.5).set_ease(Tween.EASE_IN)
    await tween.finished


func pop_in_tween():
    customer.texture = customers.pick_random()

    var tween : Tween = create_tween()
    tween.tween_property(customer, 'position:y', 0, 0.5).set_ease(Tween.EASE_OUT)
    await tween.finished


func _on_order_delivered(order_delivery : OrderDelivery):
    update_text(order_delivery.msg)
    accept.visible = false
    # TODO use an animation player this is crazy
    await get_tree().create_timer(4).timeout
    dialog_bubble.visible = false
    await pop_out_tween()
    await get_tree().create_timer(2).timeout
    await pop_in_tween()
    await get_tree().create_timer(0.5).timeout
    Singleton.next_order()
    dialog_bubble.visible = true
    accept.visible = true

    
