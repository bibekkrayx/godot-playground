extends Node

const MAIN = preload("uid://dp8sqrwh8i225")
const GAME = preload("uid://djhsp5uq2x08g")

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS # keep input alive while tree paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		load_main_screen()

func load_game_screen() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(GAME)

func load_main_screen() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(MAIN)
