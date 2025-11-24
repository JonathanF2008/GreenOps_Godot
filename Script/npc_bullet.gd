extends RigidBody2D

var speed = 800

func _physics_process(_delta):
	
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

func _on_body_entered(body):
	if body.is_in_group("test"):
		queue_free()
