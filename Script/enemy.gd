extends Node2D

@export var player_path: NodePath
@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.4

@onready var player = get_node(player_path)
@onready var ray = $RayCast2D
@onready var timer = $Timer
@onready var bullet_spawn = $Marker2D

func _ready():
	timer.wait_time = fire_rate

func _physics_process(delta):
	if !player:
		return

	# Rotér mot spilleren
	look_at(player.global_position)

	# Oppdater raycast slik at den peker mot spilleren
	ray.target_position = player.global_position - global_position

	# Sjekk om vi ser spilleren
	if ray.is_colliding() and ray.get_collider() == player:
		if timer.is_stopped():
			timer.start()
			shoot()
	else:
		timer.stop()

func shoot():
	if bullet_scene == null:
		return

	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_spawn.global_position
	bullet.rotation = rotation
	get_tree().current_scene.add_child(bullet)
