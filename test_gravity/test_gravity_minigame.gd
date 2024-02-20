extends Node2D


signal win
signal lose

var explosion_scene = preload("res://test_gravity/explosion.tscn")
var asteroid_scene = preload("res://test_gravity/asteroid.tscn")
@export var asteroids_spawned = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	win.connect(_on_win)
	lose.connect(_on_lose)
	$Parking_lot.body_entered.connect(_on_parking_lot_body_entered)
	for i in range(asteroids_spawned):
		var asteroid_scene_instance = asteroid_scene.instantiate()
		add_child(asteroid_scene_instance)
		asteroid_scene_instance.body_entered.connect(_on_asteroid_body_entered)


func _on_asteroid_body_entered(body):
	var instantiate_explosion = explosion_scene.instantiate()
	#$spaceship.add_child(instantiate_explosion)
	$spaceship/AnimatedSprite2D.show()
	$spaceship/Sprite2D.hide()
	$spaceship/AnimatedSprite2D.play()
	$spaceship/CollisionShape2D.set_deferred("disabled",true)
	$spaceship.thrust = 0
	$spaceship.velocity = Vector2.ZERO
	lose.emit()


func _on_parking_lot_body_entered(body):
	if body.name == "spaceship":
		win.emit()


func _on_win():
	print("next scene")


func _on_lose():
	print("lose")
