extends Resource

class_name AbilityMenu

signal update
signal resize

@export var menu_slots: Array[AbilitySlot]

func insert(selection: Ability):
	#if item exists in inv, add amount by 1
	var item_slots = menu_slots.filter(func(slot): return slot.ability == selection)
	if not item_slots.is_empty():
		emit_signal("resize")
	else:
		var empty_slots = menu_slots.filter(func(slot): return slot.ability == null)
		if not empty_slots.is_empty():
			empty_slots[0].ability = selection
			#empty_slots[0].amount = 1
		else:
			resize_array(selection)
		update.emit()


func resize_array(selection: Ability):
	menu_slots.resize(menu_slots.size() + 1)
	menu_slots[menu_slots.size() - 1] = AbilitySlot.new()
	emit_signal("resize")
	insert(selection)

