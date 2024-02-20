extends Node2D


@export var MAX_MAGNITUDE = 1500
@onready var RedArrow = $%RedArrow
@onready var CameraPosition = $%CameraPosition

var degrees = 0
var magnitude = 0
var red_arrow_max_scale_x = 0.1
var red_arrow_max_scale_y = 0.02
var launched = false
var Projectile = preload("res://Scenes/projectile.tscn")


func _ready():
	RedArrow.scale = Vector2(0, red_arrow_max_scale_y)



func _process(delta):
	degrees += Input.get_axis("ui_left", "ui_right")
	magnitude += MAX_MAGNITUDE * 0.01 * Input.get_axis("ui_down", "ui_up")
	
	degrees = clamp(degrees, -90, 0)
	magnitude = clamp(magnitude, 0, MAX_MAGNITUDE)
	
	RedArrow.rotation_degrees = degrees
	RedArrow.scale.x = magnitude * red_arrow_max_scale_x/MAX_MAGNITUDE
	
	if (not launched) and (Input.is_action_just_pressed("ui_accept")):
		launched = true
		var projectile = Projectile.instantiate()
		projectile.global_position = RedArrow.global_position
		projectile.degrees = degrees
		projectile.magnitude = magnitude
		CameraPosition.setFollow(projectile)
		projectile.connect("floored", returnCamera)
		add_child(projectile)


func returnCamera():
	CameraPosition.following = false
	launched = false
