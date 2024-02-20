extends Marker2D


@export var followSpeed = 1
@export var returnSpeed = 0.01
@export var returnNode: Node2D

var followNode: Node2D
var following = false


# Called when the node enters the scene tree for the first time.
func _ready():
	following = false
	global_position = returnNode.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if following:
		global_position = global_position.lerp(followNode.global_position, followSpeed)
	else:
		global_position = global_position.lerp(returnNode.global_position, returnSpeed)


func setFollow(followNode: Node2D):
	self.followNode = followNode
	following = true
