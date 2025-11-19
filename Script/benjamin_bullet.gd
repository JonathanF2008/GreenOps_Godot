extends RigidBody2D

@export var speed = 300
@export var damage = 10

func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		if randi() % 2 == 0:
			body.take_damage(damage)
		queue_free()
