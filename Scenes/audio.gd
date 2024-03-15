extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_space_finished():
	$space._set_playing(true)


func _on_classical_finished():
	$classical._set_playing(true)
