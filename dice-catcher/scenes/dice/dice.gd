class_name Dice

extends Area2D

signal off_screen

const SPEED: float = 80.0
const BUFFER: float = 60
const ROTATION_SPEED: float = 2 * PI

var _rotation_speed = ROTATION_SPEED


@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if randf() < 0.5:
		_rotation_speed *= -1 
	position.x = randf_range(
		get_viewport_rect().position.x + BUFFER, 
		get_viewport_rect().end.x - BUFFER
		)
	position.y = get_viewport_rect().position.x - BUFFER

func _physics_process(delta: float) -> void:
	position.y += SPEED * delta
	sprite_2d.rotate(_rotation_speed * delta)
	check_off_screen()
	
func check_off_screen() -> void:
	if get_viewport_rect().end.y < position.y:
		get_tree().paused = true
		off_screen.emit()
		queue_free()
