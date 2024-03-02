extends State


class_name PickAbility
var CurrentMenu : Node2D
@export var HomeMenu : Node2D
var Currentindex = 0
var NewMenuIndex = 0
var Buttons : Array
var MenuChildren
var CurrentSelectedButton :Node2D
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
func  Enter():
	GetButtonToUse()
func Exit():
	pass
func  Update(_delta:float):
	pass
func Physics_Update(_delta:float):
	pass
func Unhandled_input(event):
	if event.is_action_pressed("Interact"):
		CurrentSelectedButton.OnUse()

	for dir in inputs.keys():
		if event.is_action_pressed(dir):


			if dir == "left":
				CurrentSelectedButton.ShowUi($"../../hideMarkerCardUi2")

			if dir =="right":
				CurrentSelectedButton.ShowUi($"../../ShowMarkerCardUi")


			if dir =="up":
				Currentindex -= 1

				UpdateIndex()

			if dir =="down":
				Currentindex += 1
				UpdateIndex()
			CurrentSelectedButton.UpdateUi()



func GetButtonsForMenu(Menu):
	#get  the useAble UI part
	CurrentMenu = Menu
	Buttons = []
	MenuChildren = Menu.get_children()
	for button in MenuChildren:
		var ChildOfButton = button.get_children()
		if button.is_in_group("PlayerButton"):
			Buttons.append(button)
	CurrentSelectedButton = Buttons[0]
	SelectButton()

func UpdateIndex():

	if Currentindex >Buttons.size() -1:
		Currentindex = 0
	if Currentindex < 0 :
		Currentindex = Buttons.size() - 1
	SelectButton()
func SelectButton():
	if Buttons.size() == 1:
		Currentindex = 0
	for button in Buttons:
		button.Selected(false)
	CurrentSelectedButton= Buttons[Currentindex]
	CurrentSelectedButton.Selected(true)
func GetButtonToUse():
	GetButtonsForMenu(HomeMenu)
	SelectButton()
