extends Node


@onready var hobbit: Hobbit = $Hobbit


func _on_wizard_spell_cast() -> void:
	hobbit.scale = Vector2(0.2, 0.2)
	hobbit.set_process(false)
