extends CharacterBody2D

@export var speed = 200
@export var grow_speed = 0.3
var direction = Vector2.RIGHT
var scale_direction = Vector2(1,1)


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += speed*direction*delta
	scale += grow_speed*scale_direction*delta
	if scale.x < 0.265001:
		scale = Vector2(0.265001, 0.265001)
	elif scale.x > 1.914999:
		scale = Vector2(1.914999,1.914999)



func _on_radius_body_exited(_body):
	direction *= -1
	z_index *= -1


func _on_midline_body_exited(_body):
	scale_direction *= -1
	print(scale)
