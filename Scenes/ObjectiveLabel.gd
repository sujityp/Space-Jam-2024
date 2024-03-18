extends Label


func _process(delta):
	if State.player_speaking:
		hide()
	else:
		show()
		
	if State.clock % 2 == 0:
		text = "Someone's waiting at the reception table!"
	else:
		text = "Park the eckle!"
	
	if State.clock == 200:
		text = "Pick up the phone!"
