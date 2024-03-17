extends Area2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "clock"
@export var background_resource: String

@onready var State = get_node("/root/State")
@onready var Background = $%Background

var player_inside = false 

func _ready():
	Background.hide()


func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept") and not State.player_speaking:
		action()
	if State.player_speaking:
		Background.set_texture(load(State.location))
		Background.show()
	else: Background.hide()


func action():
	State.player_speaking = true
	#print(State.player_speaking)
	#print(State.location)
	#Background.texture = load(State.location)
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start + str(State.clock))


func _on_area_entered(area):
	player_inside = true


func _on_area_exited(area):
	player_inside = false
