extends CharacterBody2D


var direction = Vector2(1,0)
@export var max_speed = 1000
@export var thrust = 20
var current_speed = 0

var space_held = false
var left_held = false
var right_held = false


func _ready():
	$AnimatedSprite2D.hide()


func _physics_process(delta):
	if right_held && !left_held:
		rotation_degrees += 5
	elif left_held && !right_held:
		rotation_degrees -= 5
	
	direction = Vector2(cos(deg_to_rad(rotation_degrees)),sin(deg_to_rad(rotation_degrees)))
	
	if space_held:
		velocity += thrust*direction
		if velocity.length() > max_speed:
			velocity = velocity.normalized()*max_speed
	move_and_slide()
	
	if position.y > 600:
		position.y = 600
		velocity.y = 0
	elif position.y < 0:
		position.y = 0
		velocity.y = 0



func _input(event):
	if Input.is_action_just_pressed("ui_left"):
		left_held = true
	elif  Input.is_action_just_released("ui_left"):
		left_held = false
	
	if Input.is_action_just_pressed("ui_right"):
		right_held = true
	elif  Input.is_action_just_released("ui_right"):
		right_held = false

	if Input.is_action_just_pressed("ui_select"):
		space_held = true
	elif Input.is_action_just_released("ui_select"):
		space_held = false


func _on_animated_sprite_2d_animation_finished():
	position = Vector2(86,305)
	rotation_degrees = 0
	thrust = 20
	$AnimatedSprite2D.hide()
	$Sprite2D.show()
	$CollisionShape2D.set_deferred("disabled", false)
