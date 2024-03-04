extends Node


var player_speaking: bool:
	set(value):
		if value == false:
			await get_tree().create_timer(0.5).timeout
			player_speaking = false
		if value ==  true:
			player_speaking = true
