extends Node2D

@onready var main = get_tree().get_root().get_node("MainGame")
@onready var projectile = load("res://scenes/bullet/bullet.tscn")

var team = "red"
var on_cd := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	actions()
	color_set()
	shoot()
	
	
func actions():
	if team == "red":
		if Input.is_action_pressed("red_aimleft") and rotation_degrees <= 270:
			rotation_degrees += 5
		if Input.is_action_pressed("red_aimright") and rotation_degrees >= 90:
			rotation_degrees -= 5
			
		if rotation_degrees > 270:
			rotation_degrees = 270
		if rotation_degrees < 90:
			rotation_degrees = 90
	if team == "blue":
		pass


func shoot():
	if !on_cd:
		var instance = projectile.instantiate()
		instance.dir = rotation
		instance.spawnPos = self.get_node("BulletSpawnLoc").global_position
		instance.spawnRot = rotation
		instance.team = self.team
		main.add_child.call_deferred(instance)
		on_cd = true

func color_set():
	if self.team == "red":
		$Sprite2D.modulate = Color(1.0, 0.0, 0.0, 1.0)
	

func _on_shoot_cd_timeout() -> void:
	%ShootCD.start(0.2)
	on_cd = false
