extends Control

@export var grid_container: GridContainer
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
@export var item_slot_preload: PackedScene
@export var item_description: Label

@onready var inv: Inventory = preload("res://Code/Inventory/inventory.tres")
@onready var slots: Array = grid_container.get_children()

var Currentindex = 0
var Items : Array
var GridChildren
var CurrentSelectedButton: ItemSlotBase
var bIsOpen: bool = false

#for testing insert inventory
@export var test_item: Array[InventoryItem]
func _ready():
	inv.connect("resize", add_item_slots)
	inv.connect("update", update_slots)
	
	#for testing insert inventory
	inv.insert(test_item[0])
	inv.insert(test_item[1])
	inv.insert(test_item[2])
	inv.insert(test_item[2])
	inv.insert(test_item[2])
	inv.insert(test_item[2])
	inv.insert(test_item[2])
	inv.insert(test_item[2])
	inv.insert(test_item[3])
	inv.insert(test_item[4])
	
	
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
	slots = grid_container.get_children()
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])


func open():
	visible = true
	bIsOpen = true
	GameManager.state = GameManager.GameState.IN_MENU


func close():
	visible = false
	bIsOpen = false
	GameManager.state = GameManager.GameState.FREEWALK


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
			if dir == "up":
				Currentindex -= grid_container.columns
			if dir == "down":
				Currentindex += grid_container.columns
			UpdateIndex()


func add_item_slots():
	for i in grid_container.columns:
		var new_slot = item_slot_preload.instantiate()
		grid_container.add_child(new_slot)


func GetButtonsForMenu(Grid):
	Items = []
	GridChildren = Grid.get_children()
	for item in GridChildren:
		#if item.is_in_group("PlayerButton"):
		Items.append(item)
	CurrentSelectedButton = Items[0]
	SelectButton()


func UpdateIndex():
	if Currentindex == Items.size():
		Currentindex = 0
	elif Currentindex > Items.size() - 1:
		Currentindex = Currentindex - Items.size()
	if Currentindex < 0 :
		Currentindex = Currentindex + Items.size()
	
	SelectButton()


func SelectButton():
	if Items.size() == 1:
		Currentindex = 0
	for item in Items:
		item.bIsSelected = false
		item.Selected()
	CurrentSelectedButton = Items[Currentindex]
	CurrentSelectedButton.bIsSelected = true
	CurrentSelectedButton.Selected()
	if inv.slots[Currentindex].item:
		item_description.text = inv.slots[Currentindex].item.description
	else:
		item_description.text = ""


func ChangeVisibility(Visibility):
	visible = Visibility



