extends Area2D
class_name snapPlace
@export var hasSigil: bool = false
@export var sigil: Node2D = null
@onready var Sprite_area: Sprite2D = $Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_entered(area: Area2D) -> void:
	Sprite_area.show()


func _on_area_exited(area: Area2D) -> void:
	if sigil != null and area == sigil.get_node("Area2D"):
		sigil = null
		hasSigil = false
	Sprite_area.hide()
