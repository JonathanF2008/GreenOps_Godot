<<<<<<< Updated upstream
extends CharacterBody2D
var bullet_path=preload("res://bullet.gd")
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		fire()


func fire():
	var bullet=bullet_path.instantiate()
	bullet.dir=rotation
	bullet.pos=$Node2D.global_position
	bullet.rota=global_position
	get_parent().add_child(bullet)
=======
extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
>>>>>>> Stashed changes
