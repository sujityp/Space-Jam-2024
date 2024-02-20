extends Node2D


signal minigame_won
signal minigame_lost

var asteroid_scene = preload("res://test_gravity/asteroid.tscn")
@export var asteroids_spawned = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(asteroids_spawned):
		var asteroid_scene_instance = asteroid_scene.instantiate()
		add_child(asteroid_scene_instance)
		asteroid_scene_instance.body_entered.connect(_on_asteroid_body_entered)


func _on_asteroid_body_entered(body):
	if not $spaceship/AnimatedSprite2D.is_playing():
		$spaceship/Sprite2D.hide()
		$spaceship/AnimatedSprite2D.show()
		$spaceship/AnimatedSprite2D.play()
		$spaceship.thrust = 0
		$spaceship.velocity = Vector2.ZERO
		minigame_lost.emit()


func _on_parking_lot_body_entered(body):
	if body.name == "spaceship":
		$spaceship.thrust = 0
		$spaceship.velocity = Vector2.ZERO
		minigame_won.emit()
