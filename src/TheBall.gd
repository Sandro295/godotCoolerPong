extends KinematicBody2D

const theBallSpeed = 3
var velocity = Vector2(theBallSpeed, -theBallSpeed)

func _physics_process(delta):
	var collision = move_and_collide(velocity, true)
#	var collision = get_last_slide_collision()
	if collision:
		print(collision)
		velocity = velocity.bounce(collision.normal)
		var tile_pos = collision.collider.world_to_map(position)
		# Find the colliding tile position
		tile_pos -= collision.normal
		# Get the tile id
		var tile_id = collision.collider.get_cellv(tile_pos)
		var tile_name = collision.collider.tile_set.tile_get_name(tile_id)
		print(tile_name)

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
