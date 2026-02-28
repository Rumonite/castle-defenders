extends Node2D

@onready var main = get_tree().get_root().get_node("MainGame")
@onready var projectile = load("res://scenes/bullet/bullet.tscn")
var on_cd := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	rotation_degrees += 5
	shoot()
	
	
func actions():
	pass
func shoot():
	if !on_cd:
		var instance = projectile.instantiate()
		instance.dir = rotation
		instance.spawnPos = self.get_node("BulletSpawnLoc").global_position
		instance.spawnRot = rotation
		main.add_child.call_deferred(instance)
		on_cd = true
	


func _on_shoot_cd_timeout() -> void:
	%ShootCD.start(0.1)
	on_cd = false
