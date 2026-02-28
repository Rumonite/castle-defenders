extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%RedCannon.position = Vector2(360, 100)
	%RedCannon.team = "red"
	%BlueCannon.position = Vector2(360, 924)
	%BlueCannon.team = "blue"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
