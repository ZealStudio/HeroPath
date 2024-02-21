extends Control

@export var grid_container: GridContainer

@onready var inv: Inventory = preload("res://Code/Inventory/inventory.tres")
@onready var slots: Array = grid_container.get_children()

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
