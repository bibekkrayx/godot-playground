class_name Wizard
extends Node2D

signal spell_cast

@onready var sprite: Sprite2D = $Wizard


func _ready() -> void:
	sprite.hide()


func _on_reveal_timer_timeout() -> void:
	sprite.show()


func _on_spell_timer_timeout() -> void:
	spell_cast.emit()
