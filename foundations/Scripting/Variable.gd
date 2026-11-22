@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	print("bibek  godot hi")
	var a = 234
	print(type_string(typeof(a)))
	print("==============")
	var my_loca: Vector2 = Vector2(4, 4)
	print("MY LOCA: ", my_loca.length())
