extends KinematicBody2D


var direction = Vector2.RIGHT

const theBallSpeed = 1
var velocity = Vector2(theBallSpeed, -theBallSpeed)


func _physics_process(delta):
	var collision = move_and_collide(velocity, true)
#	var collision = get_last_slide_collision()
	if collision:
		print(collision)
		velocity = velocity.bounce(collision.normal)



func _ready():
	pass # Replace with function body.


#func _process(delta):
#
#
#	for i in get_slide_count():
#		var collision = get_slide_collision(i)
#		if collision.collider is TileMap:
#			print(velocity)
#	position += theBallSpeed * delta * direction

