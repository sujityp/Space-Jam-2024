extends Area2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@onready var State = get_node("/root/State")

var player_inside = false 


func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept") and not State.player_speaking:
		action()


func action():
	State.player_speaking = true
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)


func _on_area_entered(area):
	player_inside = true


func _on_area_exited(area):
	player_inside = false
