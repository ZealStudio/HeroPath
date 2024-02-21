extends Control



var Currentindex = 0
var Buttons : Array
var CurrentSelectedButton :ButtonBase

@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
# Called when the node enters the scene tree for the first time.

func _ready():

	Buttons = get_tree().get_nodes_in_group("PlayerButton")
	CurrentSelectedButton = Buttons[0]
func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		CurrentSelectedButton.Press()
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			print_debug(dir)
			if dir == "left":
				Currentindex -= 1
			if dir =="right":
				Currentindex += 1
				pass
			UpdateIndex()

func UpdateIndex():
	if Currentindex >Buttons.size() -1:
		Currentindex = 0
	if Currentindex < 0 :
		Currentindex = Buttons.size() - 1
	SelectButton()
func SelectButton():
	CurrentSelectedButton.bIsSelected = false
	CurrentSelectedButton.Selected()
	CurrentSelectedButton= Buttons[Currentindex]
	CurrentSelectedButton.bIsSelected = true
	CurrentSelectedButton.Selected()
func ChangeVisibility(Visibility):
	visible = Visibility


