extends CharacterBody2D

@export var SPEED = 200
@export var spread_degrees: float = 7.0
@export var max_lifetime: float = 1.5

var dir: float = 0.0
var spawnPos: Vector2
var spawnRot: float
var current_life: float = 0.0
var team: String = ""

var rng = RandomNumberGenerator.new()

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	var spread_rads: float = deg_to_rad(spread_degrees)
	dir = spawnRot + randf_range(-spread_rads, spread_rads)
	global_rotation = dir
	

	color_set()
	
func _physics_process(_delta: float) -> void:
	bullet_movement()
	check_lifetime(_delta)
	
func bullet_movement():
	velocity = Vector2(0, -SPEED).rotated(dir)
	move_and_slide()


func color_set():
	if self.team == "red":
		$Sprite2D.modulate = Color(1.0, 0.0, 0.0, 1.0)
	if self.team == "blue":
		$Sprite2D.modulate = Color(0.0, 0.0, 1.0, 1.0)

func check_lifetime(delta):
	current_life += delta
	if current_life >= max_lifetime:
		_die()

func _die():
	self.queue_free()
