extends Node

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.shift_pressed and event.keycode == KEY_1:
			get_tree().change_scene_to_file("res://start.tscn")
