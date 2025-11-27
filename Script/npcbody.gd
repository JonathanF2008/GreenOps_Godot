extends CharacterBody2D

@onready var special_collision: CollisionPolygon2D = $Area2D/specialCollision

@export var bullet_scene: PackedScene
@export var shoot_delay := 0.3

var can_shoot := false
var cooldown := 0.0
var health := 3

func _physics_process(delta):
	if can_shoot:
		var player = get_tree().get_first_node_in_group("test")
		cooldown -= delta
		if cooldown <= 0:
			shoot()
			cooldown = shoot_delay

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position + Vector2(8, -11.333)

	# Aim at player
	var player = get_tree().get_first_node_in_group("test")
	if player:
		var dir = player.global_position - global_position
		bullet.rotation = dir.angle()

	get_parent().add_child(bullet)
	
func update_health(value):
	health += value
	if health <= 0:
		die()

func die():
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("test"):
		can_shoot = true
		special_collision.change_color(Color(1, 0, 0, 0.3))
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("test"):
		can_shoot = false
		special_collision.change_color(Color(1, 1, 1, 0.3))
