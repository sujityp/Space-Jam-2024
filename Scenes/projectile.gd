extends CharacterBody2D


@export var degrees: int
@export var magnitude: float
@export var gravity = Vector2.DOWN * 980

signal floored

func _ready():
	print(degrees, "\t", magnitude)
	var direction = Vector2.RIGHT.rotated(deg_to_rad(degrees))
	velocity = direction * magnitude
	print(velocity)

func _physics_process(delta):
	if not is_on_floor() and (position.y < 600):
		velocity += gravity * delta
	else:
		velocity = velocity.lerp(Vector2.ZERO, 0.1)
		await get_tree().create_timer(2.0).timeout
		floored.emit()
		queue_free()
	
	move_and_slide()
