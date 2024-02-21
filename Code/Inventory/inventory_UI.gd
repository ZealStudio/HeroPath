extends Control

@export var grid_container: GridContainer

@onready var inv: Inventory = preload("res://Code/Inventory/inventory.tres")
@onready var slots: Array = grid_container.get_children()

var Currentindex = 0
var Buttons : Array
var GridChildren
var CurrentSelectedButton: ItemSlotBase
var bIsOpen: bool = false

#for testing insert inventory
@export var test_item: InventoryItem
func _ready():
	#for testing insert inventory
	inv.insert(test_item)
	#inv.insert(test_item)
	inv.connect("update", update_slots)
	update_slots()
	close()
	GetButtonsForMenu(grid_container)
	SelectButton()


func _input(event):
	#opens inventory
	if event.is_action_pressed("i"):
		if bIsOpen:
			close()
		else:
			open()


func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])


func open():
	visible = true
	bIsOpen = true


func close():
	visible = false
	bIsOpen = false




@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
# Called when the node enters the scene tree for the first time.


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


func GetButtonsForMenu(Grid):
	Buttons = []
	GridChildren = Grid.get_children()
	for item in GridChildren:
		#if item.is_in_group("PlayerButton"):
		Buttons.append(item)
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
	for item in Buttons:
		item.bIsSelected = false
		item.Selected()
	CurrentSelectedButton= Buttons[Currentindex]
	CurrentSelectedButton.bIsSelected = true
	CurrentSelectedButton.Selected()


func ChangeVisibility(Visibility):
	visible = Visibility



