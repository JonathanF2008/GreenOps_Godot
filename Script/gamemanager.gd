extends Node

@export var characters: Array[Node] = []
var current_player_index := 0

func _ready():
	activate_current_player()

func activate_current_player():
	for character in characters:
		character.hide()
		character.set_process(false)
		character.set_physics_process(false)

	if current_player_index < characters.size():
		var player = characters[current_player_index]
		player.show()
		player.set_process(true)
		player.set_physics_process(true)
	else:
		print("Alle spillere er døde! Game over.")

func on_player_death():
	current_player_index += 1
	activate_current_player()
