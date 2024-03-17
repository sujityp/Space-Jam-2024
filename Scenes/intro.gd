extends Node2D


var MainGame = preload("res://Scenes/world.tscn")

var text_1 = "Människor."
var text_2 = "The charge of the stars."
var text_3 = "The herb from the heavens."
var text_4 = "It powers the entire galaxy from Gooklor to ekcles, to even toilet rocks."
var text_5 = "And it’s all thanks to Huskydory Cosmo, who invented it while struggling to make ends meet, juggling three dead-end jobs as an underwater ethicist."
var text_6 = "His invention led to the foundation of SynthScape Labs back in the Lateral Ages. It is currently valued at 81 flumptillion $hmeckels. There seem to be no signs of slowing down either, as the last fiscal quarter was the company’s most successful one yet."
var text_7 = "To celebrate this occasion, President Cosmo and Vice-President MC have planned an elaborate end-of-the-jolecade party to celebrate all the hard work their employees have put in."
var text_8 = "The party features an all-you-can-stuff buffet, a classical-space orchestra, and the highly anticipated fireworks show at the end of the sol. The entire party takes place on their local exo-Moon, overlooking Project Earth."
var text_9 = "You are playing as MC (contrary to popular belief, MC does not stand for ‘Main Character’, but instead for ‘Mister Coaquimtadgh’)."
var text_10 = "You are playing as the VP (contrary to popular belief, VP does not stand for ‘Vondrizzle Plorptastic’, but instead for  ‘Vice President’)."
var text_11 = "You have spent the last 20 Blimptimes planning this event. Do NOT let it go to waste."
var text_12 = "All you have to do is ensure your employees are having a good time this sol."
var text_13 = "Good luck!"






# Called when the node enters the scene tree for the first time.
func _ready():
	$title_name.hide()
	$title_screen.hide()
	$HSplitContainer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		if $HSplitContainer/Label.text == '':
			$title_name.hide()
			$HSplitContainer/Label.text = text_1
			$HSplitContainer.show()
		elif $HSplitContainer/Label.text == text_1:
			$HSplitContainer/Label.text = text_2
		elif $HSplitContainer/Label.text == text_2:
			$HSplitContainer/Label.text = text_3
		elif $HSplitContainer/Label.text == text_3:
			$HSplitContainer/Label.text = text_4
		elif $HSplitContainer/Label.text == text_4:
			$HSplitContainer/Label.text = text_5
		elif $HSplitContainer/Label.text == text_5:
			$HSplitContainer/Label.text = text_6
		elif $HSplitContainer/Label.text == text_6:
			$HSplitContainer/Label.text = text_7
		elif $HSplitContainer/Label.text == text_7:
			$HSplitContainer/Label.text = text_8
		elif $HSplitContainer/Label.text == text_8:
			$HSplitContainer/Label.text = text_9
		elif $HSplitContainer/Label.text == text_9:
			$HSplitContainer/Label.text = text_10
		elif $HSplitContainer/Label.text == text_10:
			$HSplitContainer/Label.text = text_11
		elif $HSplitContainer/Label.text == text_11:
			$HSplitContainer/Label.text = text_12
		elif $HSplitContainer/Label.text == text_12:
			$HSplitContainer/Label.text = text_13
		elif $HSplitContainer/Label.text == text_13:
			$inception._set_playing(false)
			if not $clapping.playing:
				$clapping._set_playing(true)


func _on_welcome_finished():
	$inception._set_playing(true)
	$title_name.show()
	$title_screen.show()
	$HSplitContainer/Label.text = ''

func _on_inception_finished():
	$inception._set_playing(true)


func _on_clapping_finished():
	var worldInstance = MainGame.instantiate()
	get_tree().root.add_child(worldInstance)
	queue_free()
