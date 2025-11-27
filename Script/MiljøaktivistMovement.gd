extends CharacterBody2D

var target_position = position
var speed := 150.0
var moving = false
var health = 100
@onready var health_bar = $ProgressBar

func _ready() -> void:
	update_health(0)


func _unhandled_input(event: InputEvent) -> void:
	if !moving and Input.is_action_just_pressed("Bevege_Miljøaktivist"):
		target_position = get_global_mouse_position()
		moving = true



func _process(delta: float) -> void:
	if moving:
		if position == target_position:
			moving = false
		else:
			position = position.move_toward(target_position, speed * delta)



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("AAAA")
	var away = (position - body.position).normalized()
	moving = false


func update_health(value):
	health += value
	health_bar.value = health
	print(health)
	if health <= 0:
		die()

func die():
	get_tree().change_scene_to_file("res://start.tscn")
