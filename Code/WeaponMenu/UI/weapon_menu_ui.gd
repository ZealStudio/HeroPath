extends Control

@export var item_menu: WeaponMenu
@export var grid_container: GridContainer
@export var menu_slot_preload: PackedScene
@export var runtime_data: RuntimeData
@export var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

@onready var slots: Array = grid_container.get_children()

var selections: Array
var CurrentSelectedButton
var Currentindex = 0
var num_of_slots := 4
var bIsOpen: bool = false

@export var test_selection: Array[Skill]

func _ready():
	item_menu.connect("resize", add_selection_slots)
	item_menu.connect("update", update_slots)
	item_menu.insert(test_selection[0])
	item_menu.insert(test_selection[1])
	update_slots()
	GetButtonsForMenu(grid_container)
	SelectButton()


func _unhandled_input(event):
	if runtime_data.current_gameplay_state == GameManager.GameState.IN_MENU:
		if event.is_action_pressed("Interact"):
			CurrentSelectedButton.Press(item_menu.menu_slots[Currentindex])
			SelectButton()
			get_parent().remove_child(self)
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
				if dir == "up":
					Currentindex -= grid_container.columns
				if dir == "down":
					Currentindex += grid_container.columns
				UpdateIndex()


#func open():
	#visible = true
	#bIsOpen = true
	#runtime_data.current_gameplay_state = GameManager.GameState.IN_MENU
#
#
#func close():
	#visible = false
	#bIsOpen = false
	#runtime_data.current_gameplay_state = GameManager.GameState.FREEWALK
#

func update_slots():
	Currentindex = clamp(Currentindex, 0, item_menu.menu_slots.size() - 1)
	slots = grid_container.get_children()
	if item_menu.menu_slots.size() <= num_of_slots:
		for i in item_menu.menu_slots.size():
			slots[i].update(item_menu.menu_slots[i])
	elif Currentindex >= num_of_slots:
		for i in slots.size():
			slots[i].update(item_menu.menu_slots[Currentindex - (num_of_slots - 1) + i])
			print(Currentindex - (num_of_slots + 1) + i)
	elif Currentindex <= num_of_slots - 1:
		for i in slots.size():
			slots[i].update(item_menu.menu_slots[i])


func add_selection_slots():
	if grid_container.get_children().size() < num_of_slots:
		for i in grid_container.columns:
			var new_slot = menu_slot_preload.instantiate()
			grid_container.add_child(new_slot)


func UpdateIndex():
	if Currentindex > item_menu.menu_slots.size() - 1:
		Currentindex = 0
	if Currentindex < 0 :
		Currentindex = Currentindex + item_menu.menu_slots.size()
	update_slots()
	SelectButton()


func SelectButton():
	if selections.size() == 1:
		Currentindex = 0
	for select in selections:
		select.bIsSelected = false
		select.Selected()
	var clamped_index = clamp(Currentindex, 0, num_of_slots - 1)
	if selections.size() > 0:
		CurrentSelectedButton = selections[clamped_index]
		CurrentSelectedButton.bIsSelected = true
		CurrentSelectedButton.Selected()


func GetButtonsForMenu(Grid):
	selections = []
	var GridChildren = Grid.get_children()
	for item in GridChildren:
		selections.append(item)
	if selections.size() > 0:
		CurrentSelectedButton = selections[0]
	SelectButton()
