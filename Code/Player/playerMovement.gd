extends Area2D


var bCanMove = true
@export var PlayerStat : PlayerBase
@export var runtime_data: RuntimeData
@onready var MoveTimer = $MoveTimer
@onready var ray = $RayCast2D
@export var tile_size = 64
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
@export var inventory: Inventory


func _ready():
	PlayerStat = $StatHolder
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		if  ray.get_collider() and ray.get_collider().is_in_group("Items"):
			collect_item(ray.get_collider())
		elif ray.get_collider() and ray.get_collider().is_in_group("NPC")\
		 and runtime_data.current_gameplay_state == GameManager.GameState.FREEWALK:
			GameManager.emit_signal("npc_interact", inventory)


	for dir in inputs.keys():
		if runtime_data.current_gameplay_state == GameManager.GameState.FREEWALK:
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


func collect_item(item: InventoryItem):
	inventory.insert(item)
