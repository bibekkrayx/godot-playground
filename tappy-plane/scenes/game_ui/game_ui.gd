class_name GameUi

extends Control

@onready var label_game_over: Label = $MarginContainer/LabelGameOver
@onready var sound: AudioStreamPlayer = $Sound
@onready var game_over_timer: Timer = $GameOverTimer
@onready var label_press_jumb: Label = $MarginContainer/LabelPressJumb
@onready var label_score: Label = $MarginContainer/LabelScore

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		GameManager.load_game_screen()
	if event.is_action_pressed("jump") and label_press_jumb.visible:
		GameManager.load_main_screen()


func _ready() -> void:
	SignalHub.tappy_died.connect(game_over)
	SignalHub.point_scored.connect(_on_point_scored)

func game_over() -> void:
	sound.play()
	label_game_over.show()
	game_over_timer.start()
	

func _on_game_over_timer_timeout() -> void:
	label_game_over.hide()
	label_press_jumb.show()
	
func _on_point_scored(score: int) -> void:
	label_score.text = str(score).pad_zeros(4)
