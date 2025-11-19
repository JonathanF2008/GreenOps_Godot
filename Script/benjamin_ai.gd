extends CharacterBody2D

@onready var vision_triangle: CollisionPolygon2D = $Area2D/specialCollision

@export var shoot_cooldown: float = 1.0
var can_shoot: bool = true

func _ready():
	pass

func _physics_process(delta):
	var player = get_node_or_null("player") # <-- path til spillernode
	if player:
		if is_player_in_vision(player):
			shoot_at_player()

func is_player_in_vision(player):
	var local_player_position = vision_triangle.to_local(player.global_position)
	return vision_triangle.polygon.collide_point(local_player_position)

func shoot_at_player():
	if can_shoot:
		# Insert your shooting code here
		print("Shooting at the player!")  # Replace with your shooting logic
		can_shoot = false
		# Wait for cooldown before next shot
		await get_tree().create_timer(shoot_cooldown).timeout
		can_shoot = true

# Optional: handle detection when player enters/exits the vision area
# func _on_area_body_entered(body):
#     pass

# func _on_area_body_exited(body):
#     pass
