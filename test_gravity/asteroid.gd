extends Area2D
@export var speed = 20
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	rotation_degrees += randf_range(0,180)
	direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	position = Vector2(randf_range(600,3000),randf_range(0,600))

func _physics_process(delta):
	position += direction*speed*delta





