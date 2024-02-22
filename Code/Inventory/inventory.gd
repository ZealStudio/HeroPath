extends Resource

class_name Inventory

signal update
signal resize

@export var empty_item_slot: InventorySlot
@export var slots: Array[InventorySlot]

#when you collect item -> use this function to insert it into inventory
func insert(item: InventoryItem):
	#if item exists in inv, add amount by 1
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if not item_slots.is_empty():
		item_slots[0].amount += 1
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		print(empty_slots)
		if not empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = 1
		else:
			resize_array(item)
	update.emit()


func resize_array(item: InventoryItem):
	slots.resize(slots.size() + 4)
	for i in 4:
		slots[slots.size() - (i + 1)] = InventorySlot.new()
	emit_signal("resize")
	insert(item)
