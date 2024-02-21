extends Control


@export var CurrentMenu : BaseMenu
var Currentindex = 0
var Buttons : Array
var MenuChildren
var CurrentSelectedButton :ButtonBase

@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
# Called when the node enters the scene tree for the first time.

func _ready():
	GetButtonsForMenu(CurrentMenu)
	SelectButton()
func _unhandled_input(event):
	if event.is_action_pressed("Interact"):
		CurrentSelectedButton.Press()
		SelectButton()
		if CurrentSelectedButton.MainMenuToOpen != null:
			GetButtonsForMenu(CurrentSelectedButton.MainMenuToOpen)
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			#print_debug(dir)
			if dir == "left":
				Currentindex -= 1
			if dir =="right":
				Currentindex += 1
				pass
			UpdateIndex()


func GetButtonsForMenu(Menu):
	Buttons = []
	MenuChildren = Menu.get_children()
	for X in MenuChildren:
		if X.is_in_group("PlayerButton"):
			Buttons.append(X)
	CurrentSelectedButton = Buttons[0]
	SelectButton()



func UpdateIndex():
	if Currentindex >Buttons.size() -1:
		Currentindex = 0
	if Currentindex < 0 :
		Currentindex = Buttons.size() - 1
	SelectButton()
func SelectButton():
	if Buttons.size() ==1:
		Currentindex = 0
	for X in Buttons:
		X.bIsSelected = false
		X.Selected()
	CurrentSelectedButton= Buttons[Currentindex]
	CurrentSelectedButton.bIsSelected = true
	CurrentSelectedButton.Selected()
func ChangeVisibility(Visibility):
	visible = Visibility


