extends Control
@onready var order_approval_text: Label = $OrderApprovalText
@onready var order_approval_emoji: TextureRect = $OrderApprovalEmoji


func _process(delta: float) -> void:
    order_approval_emoji.texture.region = Rect2(1 + 21, 21, 21, 19)
    order_approval_text.text = "Approval %d %%" % round(Singleton.order_approval)
