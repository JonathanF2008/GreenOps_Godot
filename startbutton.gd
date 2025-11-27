extends Button

func _ready() -> void:
	pass # Replace with function body.


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://tscn/Scene1Helicopter.tscn")
