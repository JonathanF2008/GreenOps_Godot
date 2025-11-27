extends RigidBody2D

var speed = 800

func _physics_process(_delta):
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed
	
func _ready() -> void:
	#connect("body_entered", _on_body_entered)
	pass

func _on_body_entered(body):
	if body.is_in_group("test") or body.has_method("update_health"):
		body.update_health(-10)
		queue_free()
	elif body.is_in_group("walls"):
		queue_free()
