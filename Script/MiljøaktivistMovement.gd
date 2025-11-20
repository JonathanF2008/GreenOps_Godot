extends CharacterBody2D

@onready var agent: NavigationAgent2D = $NavigationAgent2D

var speed := 150.0

func _ready():
	agent.path_desired_distance = 4
	agent.target_desired_distance = 4


func _process(delta):
	if Input.is_action_just_pressed("move_to_click"):
		agent.target_position = get_global_mouse_position()


func _physics_process(delta):
	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return

	var next_point = agent.get_next_path_position()
	var direction = (next_point - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
