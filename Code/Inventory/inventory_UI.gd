extends Control

@export var runtime_data: RuntimeData
@export var grid_container: GridContainer
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
@export var item_slot_preload: PackedScene
@export var item_description: Label
@export var inv: Inventory
@onready var slots: Array = grid_container.get_children()

var Currentindex = 0
var Items : Array
var GridChildren
var CurrentSelectedButton: ItemSlotBase
var bIsOpen: bool = false
var num_of_slots := 4

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
	inv.insert(test_item[5])
	inv.insert(test_item[6])
	#inv.insert(test_item[4])
	
	
	#update_slots()
	#close()
	GetButtonsForMenu(grid_container)
	SelectButton()


func _input(event):
	#opens inventory
	if event.is_action_pressed("i")\
	 and (runtime_data.current_gameplay_state == GameManager.GameState.FREEWALK\
	 or runtime_data.current_gameplay_state == GameManager.GameState.IN_MENU):
		print(runtime_data.current_gameplay_state)
		if bIsOpen:
			close()
		else:
			open()


func update_slots():
	Currentindex = clamp(Currentindex, 0, inv.slots.size() - 1)
	slots = grid_container.get_children()
	if inv.slots.size() <= num_of_slots:
		for i in inv.slots.size():
			slots[i].update(inv.slots[i])
	elif Currentindex >= num_of_slots:
		for i in slots.size():
			slots[i].update(inv.slots[Currentindex - (num_of_slots - 1) + i])
			print(Currentindex - (num_of_slots + 1) + i)
	elif Currentindex <= num_of_slots - 1:
		for i in slots.size():
			slots[i].update(inv.slots[i])


func open():
	visible = true
	bIsOpen = true
	runtime_data.current_gameplay_state = GameManager.GameState.IN_MENU


func close():
	visible = false
	bIsOpen = false
	runtime_data.current_gameplay_state = GameManager.GameState.FREEWALK


func _unhandled_input(event):
	if runtime_data.current_gameplay_state == GameManager.GameState.IN_MENU:
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
	if grid_container.get_children().size() < num_of_slots:
		for i in grid_container.columns:
			var new_slot = item_slot_preload.instantiate()
			grid_container.add_child(new_slot)


func GetButtonsForMenu(Grid):
	Items = []
	GridChildren = Grid.get_children()
	for item in GridChildren:
		Items.append(item)
	CurrentSelectedButton = Items[0]
	SelectButton()


func UpdateIndex():
	if Currentindex > inv.slots.size() - 1:
		Currentindex = 0
	if Currentindex < 0 :
		Currentindex = Currentindex + inv.slots.size()
	update_slots()
	SelectButton()


func SelectButton():
	if Items.size() == 1:
		Currentindex = 0
	for item in Items:
		item.bIsSelected = false
		item.Selected()
	var clamped_index = clamp(Currentindex, 0, num_of_slots - 1)
	CurrentSelectedButton = Items[clamped_index]
	CurrentSelectedButton.bIsSelected = true
	CurrentSelectedButton.Selected()
	
	if inv.slots[Currentindex].item:
		item_description.text = inv.slots[Currentindex].item.description
	else:
		item_description.text = ""


func ChangeVisibility(Visibility):
	visible = Visibility



