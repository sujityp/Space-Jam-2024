extends CharacterBody2D


const SPEED = 400.0
const FRIC = 0.4

@onready var AnimTree = $AnimationTree
@onready var AnimPlayer = $AnimationPlayer
@onready var AnimState = AnimTree.get("parameters/playback")

func _ready():
	global_position = State.player_position


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down"))
	if direction.x and direction.y: direction.y = 0
	
	if direction and not State.player_speaking:
		AnimTree.set("parameters/Idle/blend_position", direction)
		AnimTree.set("parameters/Run/blend_position", direction)
		AnimState.travel("Run")
		velocity = direction * SPEED
	else:
		AnimState.travel("Idle")
		velocity = velocity.lerp(Vector2.ZERO, FRIC)

	move_and_slide()
