extends Resource

class_name WeaponMenu

signal update
signal resize

@export var menu_slots: Array[WeaponSlot]

func insert(selection: Skill):
	#if item exists in inv, add amount by 1
	var item_slots = menu_slots.filter(func(slot): return slot.skill == selection)
	if not item_slots.is_empty():
		emit_signal("resize")
		print("full")
	else:
		var empty_slots = menu_slots.filter(func(slot): return slot.skill == null)
		if not empty_slots.is_empty():
			empty_slots[0].skill = selection
			#empty_slots[0].amount = 1
		else:
			resize_array(selection)
		update.emit()


func resize_array(selection: Skill):
	menu_slots.resize(menu_slots.size() + 1)
	menu_slots[menu_slots.size() - 1] = WeaponSlot.new()
	emit_signal("resize")
	insert(selection)
