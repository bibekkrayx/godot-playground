class_name Pipes

extends Node2D

const PIPE_SPEED: float = 120

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= PIPE_SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	print("lower pipe entered: ", name)


func _on_laser_body_entered(body: Node2D) -> void:
	print("point score +1")
