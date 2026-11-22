class_name Hobbit
extends Node2D

@onready var sprite: Sprite2D = $Sprite2D


func _process(delta: float) -> void:
	sprite.rotate(PI * delta)


func _on_hide_timer_timeout() -> void:
	sprite.hide()
