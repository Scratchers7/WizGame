extends Area2D

@onready var Sprite_area: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_entered(area: Area2D) -> void:
	Sprite_area.show()


func _on_area_exited(area: Area2D) -> void:
	Sprite_area.hide()
