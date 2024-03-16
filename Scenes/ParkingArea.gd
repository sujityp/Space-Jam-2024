extends Area2D


var ParkingMinigame = preload("res://Scenes/test_gravity_minigame.tscn")

var player_inside = false

signal minigame_started


func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept") and not State.in_minigame:
		action()


func action():
	State.in_minigame = true
	State.player_position = get_parent().get_node("Player").global_position
	var parkingInstance = ParkingMinigame.instantiate()
	get_tree().root.add_child(parkingInstance)
	parkingInstance.minigame_won.connect(Callable(get_parent().get_parent(), "on_minigame_won"))
	print(parkingInstance.minigame_won.get_connections())
	get_parent().queue_free()


func _on_area_entered(area):
	player_inside = true


func _on_area_exited(area):
	player_inside = false
