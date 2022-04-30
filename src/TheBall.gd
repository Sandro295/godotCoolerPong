extends KinematicBody2D

const theBallSpeed = 400
const VEL = Vector2(theBallSpeed*cos(deg2rad(45)), -theBallSpeed*sin(deg2rad(45)))
var velocity = VEL
var tilemap

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta, true)
	if collision:
#		print(collision.collider)
		velocity = velocity.bounce(collision.normal)
		if collision.collider.is_in_group("walls"):
			var tile_pos = collision.collider.world_to_map(position) - collision.normal
			# Get the tile id
			var tile_id = collision.collider.get_cellv(tile_pos)
			var tile_name = collision.collider.tile_set.tile_get_name(tile_id)
#			print(tile_name)
		if collision.collider.is_in_group("blocks"):
			hitBlock(collision)

func hitBlock(collision:KinematicCollision2D):
#	print(tilemap)
	tilemap = collision.collider
	var cell = tilemap.world_to_map(collision.position - collision.normal)
	var tileId = tilemap.get_cellv(cell)
#	print(cell)
#	print(tileId)
	if tilemap == $"../Block_2hp":
		if tileId == 0:
			tilemap.set_cellv(cell, 1)
		if tileId == 1:
			tilemap.set_cellv(cell, -1)
	if tilemap == $"../Block_3hp":
		if tileId == 0:
			tilemap.set_cellv(cell, 1)
		if tileId == 1:
			tilemap.set_cellv(cell, 2)
		if tileId == 2:
			tilemap.set_cellv(cell, -1)

func _ready():
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		retargetBall(event)

func retargetBall(event):
	var currentPos = get_position()
	if event.is_pressed():
		velocity = Vector2(0,0)
	else:
		velocity = (event.position - currentPos).normalized() * theBallSpeed
		print(currentPos)
		
