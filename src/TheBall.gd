extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direction = Vector2.RIGHT

const theBallSpeed = 100

func _physics_process(delta):
	move_and_slide(Vector2(theBallSpeed, 5.0))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	position += theBallSpeed * delta * direction
