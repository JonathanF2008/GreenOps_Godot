extends CharacterBody2D

@export var speed: float = 200
@export var stop_distance: float = 5

var target_position: Vector2
var moving := false

func _ready():
	target_position = global_position


func _physics_process(delta):
	# --- ROTER SPILLEREN MOT MUSEN HELE TIDEN ---
	look_at(get_global_mouse_position())

	# --- BEVEGELSE ---
	if moving:
		var direction = target_position - global_position

		if direction.length() > stop_distance:
			velocity = direction.normalized() * speed
		else:
			moving = false
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func _input(event):
	if Input.is_action_just_pressed("move_click"): # X eller LMB, samme hva du satte
		target_position = get_global_mouse_position()
		moving = true
