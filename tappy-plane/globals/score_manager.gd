extends Node

var _score: int
const SAVE_PATH: String = "user://tappy_save.dat"

var high_score: int = 0

func _ready() -> void:
	load_from_file()
	SignalHub.tappy_died.connect(on_tappy_died)
	
func on_tappy_died() -> void:
	if _score > high_score:
		high_score = _score
		save_to_file() 
	reset_score()

func reset_score() -> void:
	_score = 0

func add_point() -> void:
	_score += 1
	SignalHub.emit_point_scored(_score)
	
func save_to_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if !file:
		push_error("save_to_file no file found")
		return
	file.store_32(high_score)
	
func load_from_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if !file:
		return # no save yet (first run), keep high_score = 0
	high_score = file.get_32()
