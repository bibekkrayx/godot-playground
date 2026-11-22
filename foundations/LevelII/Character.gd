class_name Character

var hp: int = 120
var name: String
var weapon: String = "stone"
var health: int = 0:
	get:
		return health
	set(new_health):
		health = new_health
	

func _init(hp, name, weapon, health) -> void:
	self.hp = hp
	self.name = name
	self.weapon = weapon
	self.health = health
	

func character_hp() -> void:
	print(hp)
	
func print_char_info():
	print("D&n@3210 name: %s weapon: %s" % [name, weapon])
	
func get_health():
	print("Health %d" % health)
	
func set_health(new_health: int):
	#if new_health > 100 or new_health < 0:
		#print("Invalid health it must be between 0 to 100")
		#return 
	if new_health > 100 : 
		health = 100
	elif new_health < 0 : 
		health = 0
	else:
		health = new_health
