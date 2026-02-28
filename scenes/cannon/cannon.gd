extends Node2D

@onready var main = get_tree().get_root().get_node("MainGame")
@onready var projectile = load("res://scenes/bullet/bullet.tscn")

var team = ""
var rot_spd: float = 2.5
var on_cd := false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if team == "blue":
		rotation_degrees = 0
	if team == "red":
		rotation_degrees = 180
	
func _physics_process(_delta: float) -> void:
	actions()
	color_set()
	if team =="red" and Input.is_action_pressed("red_fire"):
		shoot()
	if team =="blue" and Input.is_action_pressed("blue_fire"):
		shoot()
	
	
func actions():
	if team == "red":
		if Input.is_action_pressed("red_aimup") and rotation_degrees <= 0:
			rotation_degrees += rot_spd
		if Input.is_action_pressed("red_aimdown") and rotation_degrees >= -180:
			rotation_degrees -= rot_spd
			
		if rotation_degrees > 0:
			rotation_degrees = 0
		if rotation_degrees < -180:
			rotation_degrees = -180
	if team == "blue":
		if Input.is_action_pressed("blue_aimup") and rotation_degrees >= 0:
			rotation_degrees -= rot_spd
		if Input.is_action_pressed("blue_aimdown") and rotation_degrees <= 180:
			rotation_degrees += rot_spd
			
		if rotation_degrees < 0:
			rotation_degrees = 0
		if rotation_degrees > 180:
			rotation_degrees = 180


func shoot():
	
	if !on_cd:
		var instance = projectile.instantiate()
		instance.dir = rotation
		instance.spawnPos = self.get_node("BulletSpawnLoc").global_position
		instance.spawnRot = rotation
		instance.team = self.team
		main.add_child.call_deferred(instance)
		
		%ShootCD.start()
		on_cd = true
		$AudioStreamPlayer.play()

func color_set():
	if self.team == "red":
		$Sprite2D.modulate = Color(1.0, 0.0, 0.0, 1.0)
	if self.team == "blue":
		$Sprite2D.modulate = Color(0.0, 0.0, 1.0, 1.0)
	

func _on_shoot_cd_timeout() -> void:
	%ShootCD.start(0.2)
	on_cd = false
