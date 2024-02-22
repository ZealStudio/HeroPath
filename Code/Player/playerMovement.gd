extends Area2D


var bCanMove = true
@export var PlayerStat : PlayerBase
@onready var MoveTimer = $MoveTimer
@onready var ray = $RayCast2D
@export var tile_size = 64
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}


func _ready():
	PlayerStat = $StatHolder
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	GameManager.state = GameManager.GameState.FREEWALK

func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		if ray.get_collider().is_in_group("Items"):
			print_debug("pick up")

	for dir in inputs.keys():
		if GameManager.state == GameManager.GameState.FREEWALK:
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
