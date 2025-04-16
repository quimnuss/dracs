extends Label


func _process(delta: float) -> void:
    self.text = "Approval %d %%" % round(Singleton.order_approval)
