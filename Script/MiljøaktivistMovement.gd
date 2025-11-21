extends CharacterBody2D

@onready var agent: NavigationAgent2D = $NavigationAgent2D

var speed := 150.0
@export var max_health := 100
var health := max_health 

func _physics_process(delta):
	if not is_visible():
		return  

	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return

	var next_point = agent.get_next_path_position()
	var direction = (next_point - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		die()

func die():
	hide()
	set_process(false)
	set_physics_process(false)
