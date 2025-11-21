extends CharacterBody2D
@onready var special_collision: CollisionPolygon2D = $Area2D/specialCollision

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("test"):
		set_physics_process(false)
		special_collision.change_color(Color(Color.RED, 0.3))
		
