extends Control

const SPEED: float = 0.05

func _process(delta: float) -> void:
    self.rotation += delta * SPEED
