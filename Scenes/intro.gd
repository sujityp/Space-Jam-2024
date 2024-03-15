extends Node2D

var text_1 = '1'
var text_2 = '2'
var text_3 = '3'
var text_4 = '4'


# Called when the node enters the scene tree for the first time.
func _ready():
	$HSplitContainer/Label.text = text_1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		if $HSplitContainer/Label.text == text_1:
			$HSplitContainer/Label.text = text_2
		elif $HSplitContainer/Label.text == text_2:
			$HSplitContainer/Label.text = text_3
		elif $HSplitContainer/Label.text == text_3:
			$HSplitContainer/Label.text = text_4
		elif $HSplitContainer/Label.text == text_4:
			$inception._set_playing(false)
			$clapping._set_playing(true)


func _on_welcome_finished():
	$inception._set_playing(true)

func _on_inception_finished():
	$inception._set_playing(true)


func _on_clapping_finished():
	queue_free()
