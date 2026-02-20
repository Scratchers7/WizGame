extends Area2D

var SPEED = 500

func _on_area_2d_body_entered(body):
	if body is TileMap or body is TileMapLayer:
		print("Collided with TileMap")
		queue_free()
	elif body is CharacterBody2D:
		print("Collided with Player")

func _physics_process(delta: float) -> void:
	position -= transform.y * gravity/2 * delta**2
	position += transform.x * SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Deletes the bullet once it is no longer visible
