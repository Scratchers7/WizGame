extends Node2D

var dragging = false
var of = Vector2(0,0)

@onready var interaction_area: Area2D = $Area2D

func check_for_snap() -> void:
	var areas = interaction_area.get_overlapping_areas()
	for area in areas:
		if area.is_in_group("sockets"):
			global_position = area.global_position
			if area.hasSigil == false:
				area.hasSigil = true
				area.sigil = self
				area.get_node("Sprite2D").hide()
			else:
				area.sigil.queue_free()
				area.sigil = self
				area.get_node("Sprite2D").hide()
			return # Snap to the first one we find and stop looking

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - of
	pass


func _on_button_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
	check_for_snap()
