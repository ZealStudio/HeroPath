extends Control

@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
# Called when the node enters the scene tree for the first time.

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			print_debug(dir)
			if dir == "left":
				pass
			if dir =="right":
				pass



