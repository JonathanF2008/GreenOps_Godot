extends RigidBody2D
var speed = 300
func _ready():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

func _on_body_entered(body):
	if body.is_in_group("npc") or body.has_method("update_health"):
		body.update_health(-1)
		queue_free()
	elif body.is_in_group("walls"):
		queue_free()
