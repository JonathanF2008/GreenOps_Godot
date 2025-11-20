extends CharacterBody2D

@onready var agent: NavigationAgent2D = $NavigationAgent2D

var speed := 150.0
@export var max_health := 100
var health := max_health

var game_manager: Node 

func _ready():
	agent.path_desired_distance = 4
	agent.target_desired_distance = 4
	if game_manager == null:
		game_manager = get_tree().get_root().get_node("GameManager") 

func _process(delta):
	# Kun aktiv spiller kan motta input
	if is_visible() and Input.is_action_just_pressed("move_to_click"):
		agent.target_position = get_global_mouse_position()

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
	if game_manager:
		game_manager.on_player_death()
