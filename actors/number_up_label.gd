extends Label

@export var value : int


func _ready():
   
    if value <= 0:
        self.text = "-%d" % value
        self.modulate = Color.RED
    else:
        self.text = "+%d" % value
        self.modulate = Color.GREEN

    var tween := create_tween()
    tween.tween_property(self, 'position:y', -50, 1.5)
    tween.parallel().tween_property(self, 'modulate:a', 0, 1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO).set_delay(0.5)
    tween.tween_callback(queue_free)
