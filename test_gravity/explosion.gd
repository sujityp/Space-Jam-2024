extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("explode")


func _on_animation_finished():
	var parent = get_parent()
	parent.position = Vector2(0,0)
	queue_free()
