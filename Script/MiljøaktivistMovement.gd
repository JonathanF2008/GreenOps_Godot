extends CharacterBody2D

var target_position = position
var speed := 150.0
var moving = false
var health = 100
@onready var health_bar = $ProgressBar

func _ready() -> void:
	update_health(health)
	

func _input(event: InputEvent) -> void:
	print(event)
	if !moving and event is InputEventMouseButton and event.pressed:
		target_position = get_global_mouse_position()
		moving = true
		update_health(-10)

func _processeses(delta: float) -> void:
	if moving:
		if position == target_position:
			moving = false
		else:
			position = position.move_toward(target_position, speed * delta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	var away = (position - body.position).normalized()
	position += away * 10.0   # move back a bit
	moving = false

func update_health(value):
	health += value
	health_bar.value = health
	if health == 0:
		die()

func die():
	queue_free()

	
