extends Node2D


var MainGame = preload("res://Scenes/world.tscn")

var text_num = -1
var welcome_finished = false
var text_arr = [
	"Människor.",
	"The charge of the stars.",
	"The herb from the heavens.",
	"It powers the entire galaxy from Gooklor to ekcles, to even toilet rocks.",
	"And it’s all thanks to Huskydory Cosmo, who invented it while struggling to make ends meet, juggling three dead-end jobs as an underwater ethicist.",
	"His invention led to the foundation of SynthScape Labs back in the Lateral Ages. It is currently valued at 81 flumptillion $hmeckels. There seem to be no signs of slowing down either, as the last fiscal quarter was the company’s most successful one yet.",
	"To celebrate this occasion, President Cosmo and Vice-President MC have planned an elaborate end-of-the-jolecade party to celebrate all the hard work their employees have put in.",
	"The party features an all-you-can-stuff buffet, a classical-space orchestra, and the highly anticipated FIREWORKS show at the end of the sol. The entire party takes place on their local exo-Moon, overlooking Project Earth.",
	"You are playing as MC, the current VP of SynthScape.",
	"Contrary to popular belief, MC does not stand for ‘Main Character’, but instead for ‘Mister Coaquimtadgh’.",
	"Contrary to popular belief, VP does not stand for ‘Vondrizzle Plorptastic’, but instead means  ‘Vice President’.",
	"You have spent the last 20 Blimptimes planning this event. Do NOT let it go to waste.",
	"All you have to do is ensure your employees are having a good time this sol.",
	"Good luck!"
]








# Called when the node enters the scene tree for the first time.
func _ready():
	$title_name.hide()
	$title_screen.hide()
	$HSplitContainer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _input(event):
	if Input.is_action_just_pressed('ui_accept') and welcome_finished:
			$title_name.hide()
			text_num += 1
			if text_num == len(text_arr) - 1:
				$inception._set_playing(false)
				$clapping._set_playing(true)
			if not text_num >= len(text_arr):
				$HSplitContainer/Label.text = text_arr[text_num]
				$HSplitContainer.show() 


func _on_welcome_finished():
	$inception._set_playing(true)
	$title_name.show()
	$title_screen.show()
	$HSplitContainer/Label.text = ''
	welcome_finished = true

func _on_inception_finished():
	$inception._set_playing(true)


func _on_clapping_finished():
	var worldInstance = MainGame.instantiate()
	get_tree().root.add_child(worldInstance)
	queue_free()
