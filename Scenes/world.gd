extends Node2D


var MoonWorld = preload("res://Scenes/moon_world.tscn")

@onready var Spaceship = $MoonWorld/Spaceship
@onready var PrezTable = $MoonWorld/SittingSprites/PrezTable
@onready var PamTable = $MoonWorld/SittingSprites/PamTable
@onready var JimTable = $MoonWorld/SittingSprites/JimTable
@onready var KidsTable = $MoonWorld/SittingSprites/KidsTable
@onready var JRPGTable = $MoonWorld/SittingSprites/JRPGTable
@onready var ScientistsTable = $MoonWorld/SittingSprites/ScientistTable
@onready var ParkingArea = $MoonWorld/ParkingArea


func _ready():
	State.clock_updated.connect(on_State_clock_updated)
	State.minigame_exited.connect(on_State_minigame_exited)
	State.stuff_todo = true
	on_State_clock_updated()


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
				JimTable.show()
				Spaceship.show()
				ParkingArea.monitoring = true
			
			2:
				JimTable.show()
				Spaceship.hide()
				ParkingArea.monitoring = false
			
			3:
				JimTable.show()
				Spaceship.show()
				JRPGTable.show()
				ParkingArea.monitoring = true


func on_minigame_won():
	var moonWorldInstance = MoonWorld.instantiate()
	add_child(moonWorldInstance)
	await get_tree().create_timer(1).timeout
	get_tree().root.get_node("test_gravity_minigame").queue_free()
	State.in_minigame = false
	State.clock += 1


func on_State_minigame_exited():
	return
	Spaceship = $MoonWorld/Spaceship
	PrezTable = $MoonWorld/SittingSprites/PrezTable
	PamTable = $MoonWorld/SittingSprites/PamTable
	JimTable = $MoonWorld/SittingSprites/JimTable
	KidsTable = $MoonWorld/SittingSprites/KidsTable
	JRPGTable = $MoonWorld/SittingSprites/JRPGTable
	ScientistsTable = $MoonWorld/SittingSprites/ScientistTable
	ParkingArea = $MoonWorld/ParkingArea
