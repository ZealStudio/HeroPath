extends Area2D


var bCanMove = true
@onready var MoveTimer = $MoveTimer
@onready var ray = $RayCast2D
@export var tile_size = 64
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}



func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


func _unhandled_input(event):

	for dir in inputs.keys():
		if event.is_action_pressed(dir) and bCanMove:
			move(dir)
			print_debug(dir)
			bCanMove = false
			MoveTimer.start()

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size


func _on_move_timer_timeout():
	print_debug("can move")
	bCanMove = true
