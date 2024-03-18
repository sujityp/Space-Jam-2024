extends Node2D


func _on_space_finished():
	$space._set_playing(true)


func _on_classical_finished():
	$classical._set_playing(true)
