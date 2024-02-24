extends Control


var CurrentMenu : Node2D
@export var HomeMenu : Node2D
var Currentindex = 0
var NewMenuIndex = 0
var Buttons : Array
var MenuChildren
var CurrentSelectedButton :Node2D
var Player : PlayerBase
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
# Called when the node enters the scene tree for the first time.

func _unhandled_input(event):

	if !Player.CanAct:
		return
	if event.is_action_pressed("Interact"):
		CurrentSelectedButton.OnUse()
		#SelectButton()
		#if CurrentSelectedButton.MainMenuToOpen != null:
			#GetButtonsForMenu(CurrentSelectedButton.MainMenuToOpen)
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			#print_debug(dir)
			if dir == "left":
				Currentindex -= 1
			if dir =="right":
				Currentindex += 1
			UpdateIndex()

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
	print_debug(CurrentSelectedButton)

func ChangeVisibility(Visibility):
	visible = Visibility

func GetButtonToUse():
	GetButtonsForMenu(HomeMenu)
	SelectButton()
	Player =  get_tree().get_nodes_in_group("PlayerStatHolder")[0]
