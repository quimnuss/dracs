extends Control
@onready var order_approval_text: Label = $OrderApprovalText
@onready var order_approval_emoji: TextureRect = $OrderApprovalEmoji

enum ApprovalStep {
    ANGRY,
    SAD,
    NEUTRAL,
    HAPPY,
    EUPHORIC,
    SLEEPY,
    CRYING,
}

var approval_step_to_smiley_rect : Dictionary[ApprovalStep, Rect2] = {
    ApprovalStep.ANGRY: Rect2(1+21, 42, 21, 19),
    ApprovalStep.SAD: Rect2(1+42, 21, 21, 19),
    ApprovalStep.NEUTRAL: Rect2(1+21, 21, 21, 19),
    ApprovalStep.HAPPY: Rect2(1, 21, 21, 19),
    ApprovalStep.EUPHORIC: Rect2(1+42, 1, 21, 19),
    ApprovalStep.SLEEPY: Rect2(1+42, 42, 21, 19),
    ApprovalStep.CRYING: Rect2(1, 42, 21, 19),
}

var current_approval_step : int = ApprovalStep.SLEEPY

func _ready():
    set_approval_smiley()

func set_approval_smiley():
    var approval_step_int : int = clamp(Singleton.order_approval/20, ApprovalStep.ANGRY, ApprovalStep.EUPHORIC)
    var approval_step : ApprovalStep = approval_step_int as ApprovalStep
    if approval_step != current_approval_step:
        current_approval_step = approval_step
        var smiley_rect : Rect2 = approval_step_to_smiley_rect[approval_step]
        order_approval_emoji.texture.region = smiley_rect
        var approval_float : float = Singleton.order_approval/100.0
        order_approval_emoji.modulate = Color.WHITE * approval_float + Color.RED * (1-approval_float)


func _process(delta: float) -> void:
    set_approval_smiley()
    order_approval_text.text = "Approval %d %%" % round(Singleton.order_approval)
