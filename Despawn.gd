extends Area2D
class_name Despawn

@export var sigil: Node2D = null
var draggable = preload("res://Scenes/draggable.tscn")

func _ready() -> void:
	spawn_new_sigil()

func spawn_new_sigil() -> void:
	print("Spawning a new Sigil")
	sigil = draggable.instantiate()
	
	# Instead of add_child(sigil), use this:
	get_tree().current_scene.add_child.call_deferred(sigil)
	
	# Since add_child is deferred, we also need to defer the position setting
	# to make sure the node actually exists in the tree before we move it.
	sigil.set_deferred("global_position", self.global_position)
	print("Spawned a new Sigil")

func _on_area_entered(area: Area2D) -> void:
	if sigil == null:
		return  # Still spawning, ignore
	var parent = area.get_parent()
	if parent != sigil:
		parent.queue_free()

func _on_area_exited(area: Area2D) -> void:
	# Once the current sigil leaves the "nest", spawn a replacement
	if area.get_parent() == sigil:
		# We no longer track the one that left
		sigil = null 
		# Wait a tiny bit or call immediately to put a new one in the shop
		spawn_new_sigil()
