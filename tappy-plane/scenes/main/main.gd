extends Control

@onready var label_score: Label = $MarginContainer/LabelScore

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		GameManager.load_game_screen()

func _ready() -> void:
	get_tree().paused = false
	label_score.text = "%04d" % ScoreManager.high_score
