@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var roko: Character = Character.new(45, "ROKO", "Fire Wood", 99)
	roko.get_health()
	roko.set_health(3233)
	roko.get_health()
	roko.set_health(-2342)
	roko.get_health()

 
