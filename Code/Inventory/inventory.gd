extends Resource

class_name Inventory

signal update
signal resize

@export var empty_item_slot: InventorySlot
@export var slots: Array[InventorySlot]

var shown_slots: Array[InventorySlot]

func _ready():
	GameManager.connect("show_slots", set_show_slots)
	for i in 4:
		shown_slots[i] = InventorySlot.new()

#when you collect item -> use this function to insert it into inventory
func insert(item: InventoryItem):
	#if item exists in inv, add amount by 1
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if not item_slots.is_empty():
		item_slots[0].amount += 1
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if not empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = 1
		else:
			resize_array(item)
	update.emit()
	if slots.size() == 4:
		for i in slots.size():
			shown_slots[i].item = slots[i].item


func resize_array(item: InventoryItem):
	slots.resize(slots.size() + 1)
	slots[slots.size() - 1] = InventorySlot.new()
	emit_signal("resize")
	insert(item)


func set_show_slots(index: int):
	for i in 4:
		shown_slots[i] = slots[index - 4]
		index += 1
