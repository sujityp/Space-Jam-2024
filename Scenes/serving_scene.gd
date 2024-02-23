extends Node2D


@export var MAX_MAGNITUDE = 1500
@onready var RedArrow = $%RedArrow
@onready var CameraPosition = $%CameraPosition
@onready var ProjectileSpawn = $%ProjectileSpawn
@onready var GUI = $%GUI

var degrees = 0
var magnitude = 0
var red_arrow_max_scale_x = 0.1
var red_arrow_max_scale_y = 0.02
var launched = false
var won_game = false
var Projectile = preload("res://Scenes/projectile.tscn")

signal minigame_won


func _ready():
	RedArrow.scale = Vector2(0, red_arrow_max_scale_y)
	GUI.hide()



func _process(delta):
	degrees += Input.get_axis("ui_left", "ui_right")
	magnitude += MAX_MAGNITUDE * 0.01 * Input.get_axis("ui_down", "ui_up")
	
	degrees = clamp(degrees, -90, 0)
	magnitude = clamp(magnitude, 0, MAX_MAGNITUDE)
	
	RedArrow.rotation_degrees = degrees
	RedArrow.scale.x = clamp(magnitude * red_arrow_max_scale_x/MAX_MAGNITUDE, 0.01, red_arrow_max_scale_x)
	
	if (not launched) and (Input.is_action_just_pressed("ui_accept")):
		launched = true
		var projectile = Projectile.instantiate()
		projectile.global_position = ProjectileSpawn.global_position
		projectile.degrees = degrees
		projectile.magnitude = magnitude
		CameraPosition.setFollow(projectile)
		projectile.connect("floored", returnCamera)
		projectile.z_index = -1
		add_child(projectile)


func returnCamera():
	CameraPosition.following = false
	if not won_game:
		launched = false


func _on_win_area_customer_served():
	won_game = true
	GUI.show()
	emit_signal("minigame_won")

