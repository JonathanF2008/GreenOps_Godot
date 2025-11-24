extends CharacterBody2D

@onready var agent: NavigationAgent2D = $NavigationAgent2D

var speed := 150.0
@export var max_health := 100
var health := max_health

var is_active := false

func set_active(value: bool):
	is_active = value
	visible = value
	set_process(value)
	set_physics_process(value)

func _process(delta):
	if not is_active:
		return
	
	if Input.is_action_just_pressed("move_to_click"):
		agent.set_target_position(get_global_mouse_position())

func _physics_process(delta):
	if not is_active:
		return

	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
	else:
		var next = agent.get_next_path_position()
		var direction = (next - global_position).normalized()
		velocity = direction * speed

	move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()
	
func die():
	queue_free()
