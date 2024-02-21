extends Resource

class_name Inventory

signal update

@export var slots: Array[InventorySlot]

#when you collect item -> use this function to insert it into inventory
func insert(item: InventoryItem):
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if not item_slots.is_empty():
		item_slots[0].amount += 1
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if not empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = 1
	update.emit()
