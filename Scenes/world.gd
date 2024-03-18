extends Node2D


var MoonWorld = preload("res://Scenes/moon_world.tscn")
var endingSequence = preload("res://Scenes/ending.tscn")

@onready var Spaceship = $MoonWorld/Spaceship
@onready var PrezTable = $MoonWorld/SittingSprites/PrezTable
@onready var PamTable = $MoonWorld/SittingSprites/PamTable
@onready var JimTable = $MoonWorld/SittingSprites/JimTable
@onready var KidsTable = $MoonWorld/SittingSprites/KidsTable
@onready var JRPGTable = $MoonWorld/SittingSprites/JRPGTable
@onready var ScientistsTable = $MoonWorld/SittingSprites/ScientistTable
@onready var ParkingArea = $MoonWorld/ParkingArea
@onready var phoneAct = $MoonWorld/Actionables/ActPhone


func _ready():
	State.clock_updated.connect(on_State_clock_updated)
	State.stuff_todo = true
	State.clock = 200


func _process(delta):
	on_State_clock_updated()
	


func on_State_clock_updated():
	if not State.in_minigame:
		var Spaceship = $MoonWorld/Spaceship
		var PrezTable = $MoonWorld/SittingSprites/PrezTable
		var PamTable = $MoonWorld/SittingSprites/PamTable
		var JimTable = $MoonWorld/SittingSprites/JimTable
		var KidsTable = $MoonWorld/SittingSprites/KidsTable
		var JRPGTable = $MoonWorld/SittingSprites/JRPGTable
		var ScientistsTable = $MoonWorld/SittingSprites/ScientistTable
		var ParkingArea = $MoonWorld/ParkingArea
		match State.clock:
			0: 
				Spaceship.hide()
				PrezTable.hide()
				PamTable.hide()
				JimTable.hide()
				KidsTable.hide()
				JRPGTable.hide()
				ScientistsTable.hide()
				ParkingArea.monitoring = false
			1:
				Spaceship.show()
				PrezTable.hide()
				PamTable.hide()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.hide()
				ScientistsTable.hide()
				ParkingArea.monitoring = true
			
			2:
				Spaceship.hide()
				PrezTable.hide()
				PamTable.hide()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.hide()
				ScientistsTable.hide()
				ParkingArea.monitoring = false
			
			3:
				Spaceship.show()
				PrezTable.hide()
				PamTable.hide()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.hide()
				ParkingArea.monitoring = true
			4:
				Spaceship.hide()
				PrezTable.hide()
				PamTable.hide()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.hide()
				ParkingArea.monitoring = false
			5:
				Spaceship.show()
				PrezTable.hide()
				PamTable.hide()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = true
			6:
				Spaceship.hide()
				PrezTable.hide()
				PamTable.hide()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = false
			7:
				Spaceship.show()
				PrezTable.hide()
				PamTable.show()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = true
			8:
				Spaceship.hide()
				PrezTable.hide()
				PamTable.show()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = false
			9:
				Spaceship.show()
				PrezTable.show()
				PamTable.show()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = true
			10:
				Spaceship.hide()
				PrezTable.show()
				PamTable.show()
				JimTable.show()
				KidsTable.hide()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = false
			11:
				Spaceship.hide()
				PrezTable.show()
				PamTable.show()
				JimTable.show()
				KidsTable.show()
				JRPGTable.show()
				ScientistsTable.show()
				ParkingArea.monitoring = false
				var endingInstance = endingSequence.instantiate()
				get_tree().root.add_child(endingInstance)
				queue_free()


func on_minigame_won():
	var moonWorldInstance = MoonWorld.instantiate()
	add_child(moonWorldInstance)
	await get_tree().create_timer(1).timeout
	get_tree().root.get_node("test_gravity_minigame").queue_free()
	State.in_minigame = false
	State.clock += 1
