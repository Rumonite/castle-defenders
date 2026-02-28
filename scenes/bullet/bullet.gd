extends CharacterBody2D

@export var SPEED = 200

var dir
var spawnPos: Vector2
var spawnRot: float
var life: float = 0

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(dir)
	check_lifetime()
	move_and_slide()

func check_lifetime():
	life +=1
	if life > 100:
		_die()
		
func _die():
	self.queue_free()
