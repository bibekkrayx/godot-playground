extends Node2D

@export var pipes_scene: PackedScene

@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
@onready var timer: Timer = $Timer
@onready var pipes_holder: Node2D = $PipesHolder


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	
	spawn_pipes()
	timer.start()


func _physics_process(delta: float) -> void:
	pass

func spawn_pipes(): 
	var new_pipe: Pipes = pipes_scene.instantiate()
	
	var random_y = randf_range(
		upper_spawn.position.y, 
		lower_spawn.position.y
		)
		
	new_pipe.position = Vector2(
		upper_spawn.position.x,
		random_y 
	)

	pipes_holder.add_child(new_pipe)

func _on_timer_timeout() -> void:
	spawn_pipes()
