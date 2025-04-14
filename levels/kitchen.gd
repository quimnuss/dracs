extends Node2D

@onready var order_text: RichTextLabel = %OrderText
@onready var dialog_bubble: Control = $DialogBubble

var typing_speed = 1

func _ready():
    Singleton.order_changed.connect(_on_order_changed)

func update_order():
    var current_order : Order = Orders.ordername_to_order(Singleton.current_order)
    order_text.text = current_order.order_long
    var typing_tween : Tween = get_tree().create_tween()
    typing_tween.tween_property(order_text, "visible_characters", order_text.get_total_character_count(), typing_speed)


func _on_order_changed():
    update_order()


func _on_accept_pressed() -> void:
    EventBus.order_accepted.emit()
    dialog_bubble.visible = false
