extends Node2D

var bullet = preload("res://tscn/bulletMiljøaktivist.tscn")

func _process(delta):
	look_at(get_global_mouse_position())
	rotation -= deg_to_rad(90)

	if Input.is_action_just_pressed("ui_accept"):
		var instance = bullet.instantiate()
		instance.global_position = global_position
		get_tree().current_scene.add_child(instance)
