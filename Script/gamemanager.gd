extends Node

var active_player

signal player_selected(player)

func _ready():
	connect("player_selected", Callable(self, "_on_player_selected"))

func _on_player_selected(player):
	if active_player and active_player != player:
		active_player.set_selected(false)

	active_player = player
	active_player.set_selected(true)
