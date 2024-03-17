extends Node


signal stuff_todo_changed
signal clock_updated
signal minigame_exited

var player_speaking: bool:
	set(value):
		if value == false:
			await get_tree().create_timer(0.5).timeout
			player_speaking = false
		if value ==  true:
			player_speaking = true


var stuff_todo: bool:
	set(value):
		stuff_todo = value
		stuff_todo_changed.emit()


var clock: int:
	set(value):
		clock = value
		clock_updated.emit()


var location: String


var in_minigame: bool:
	set(value):
		if value == false:
			await get_tree().create_timer(0.5).timeout
			in_minigame = false
			minigame_exited.emit()
		if value ==  true:
			in_minigame = true


var player_position: Vector2:
	set(value):
		player_position = value
