extends CharacterBody2D

@export var speed: float = 200
@export var stop_distance: float = 5

var target_position: Vector2
var moving := false
var selected := false

@onready var outline = $"Outline" # Sprite eller Texture som viser sirkel


func _ready():
	target_position = global_position
	outline.visible = false

var speed := 150.0
@export var max_health := 100
var health := max_health 

# -------------------------------------------------
# Valg av karakter
# -------------------------------------------------
func set_selected(value: bool):
	selected = value
	outline.visible = value


# Trigger når spilleren klikker PÅ karakteren
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		get_tree().root.call_deferred("emit_signal", "player_selected", self)


# -------------------------------------------------
# Input for bevegelse (kun aktiv spiller)
# -------------------------------------------------
func _input(event):
	if not selected:
		return

	# Venstre museknapp = bevegelse
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		target_position = get_global_mouse_position()
		moving = true


# -------------------------------------------------
# Bevegelse
# -------------------------------------------------
func _physics_process(delta):
	# Bare spilleren som er valgt skal reagere på input
	if not selected:
		return

	look_at(get_global_mouse_position())

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

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		die()

func die():
	hide()
	set_process(false)
	set_physics_process(false)
