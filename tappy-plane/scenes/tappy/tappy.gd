class_name Tappy

extends CharacterBody2D

const JUMP_FORCE: float = -400
const REV_UP: float = 10.0   # higher = faster ramp up
const REV_DOWN: float = 3.0  # lower = slower fade out
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var parallax_0: Sprite2D = $"../Parallax0"
@onready var engine: AudioStreamPlayer = $Engine


var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		_jumped = true

func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	
	if _jumped:
		velocity.y = JUMP_FORCE
		_jumped = false
		animation_player.play("fly")
	
	move_and_slide()

	# rev up while rising, ease down while falling
	var rising := velocity.y < 0
	var rate := (REV_UP if rising else REV_DOWN) * delta
	engine.volume_db = lerpf(engine.volume_db, 0.0 if rising else -20.0, rate)
	engine.pitch_scale = lerpf(engine.pitch_scale, 1.4 if rising else 0.8, rate)
	
	if is_on_floor(): die()
	
func die() -> void:
	SignalHub.emit_tappy_died()
	get_tree().paused = true
	
	
