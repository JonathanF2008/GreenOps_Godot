extends CharacterBody2D

@export var speed: float = 200.0
@export var stop_distance: float = 6.0

var target_position: Vector2
var moving: bool = false

func _ready() -> void:
	target_position = global_position

func _physics_process(delta: float) -> void:
	if moving:
		var to_target = target_position - global_position
		var dist = to_target.length()
		if dist <= stop_distance:
			moving = false
			velocity = Vector2.ZERO
		else:
			velocity = to_target.normalized() * speed
			rotation = to_target.angle()  # <-- denne linjen gjør at figuren snur seg mot målet
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Bevege Miljøaktivist"):
		target_position = get_global_mouse_position()
		moving = true
