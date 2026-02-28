extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%BlueCannon.position = Vector2(100, 360)
	%RedCannon.team = "red"
	%RedCannon.position = Vector2(924, 360)
	%BlueCannon.team = "blue"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
