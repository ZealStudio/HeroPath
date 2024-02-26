extends Resource

class_name CharacterMenu

signal update
signal resize

@export var menu_slots: Array[CharacterSlot]

func insert(selection: Weapon):
	#if item exists in inv, add amount by 1
	var item_slots = menu_slots.filter(func(slot): return slot.weapon == selection)
	if not item_slots.is_empty():
		emit_signal("resize")
		print("full")
	else:
		var empty_slots = menu_slots.filter(func(slot): return slot.weapon == null)
		if not empty_slots.is_empty():
			empty_slots[0].weapon = selection
			#empty_slots[0].amount = 1
		else:
			resize_array(selection)
		update.emit()


func resize_array(selection: Weapon):
	menu_slots.resize(menu_slots.size() + 1)
	menu_slots[menu_slots.size() - 1] = CharacterSlot.new()
	emit_signal("resize")
	insert(selection)
