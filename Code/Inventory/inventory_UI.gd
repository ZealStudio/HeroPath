extends Control

var bIsOpen: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("i"):
		if bIsOpen:
			close()
		else:
			open()


func open():
	visible = true
	bIsOpen = true


func close():
	visible = false
	bIsOpen = false
