extends Resource

class_name ItemMenu

signal update
signal resize

@export var menu_slots: Array[MenuSlot]

func insert(selection: MenuSelection):
	#if item exists in inv, add amount by 1
	var item_slots = menu_slots.filter(func(slot): return slot.selection == selection)
	if not item_slots.is_empty():
		#item_slots[0].amount += 1
		pass
	else:
		var empty_slots = menu_slots.filter(func(slot): return slot.selection == null)
		if not empty_slots.is_empty():
			empty_slots[0].selection = selection
			#empty_slots[0].amount = 1
		else:
			resize_array(selection)
	update.emit()


func resize_array(selection: MenuSelection):
	menu_slots.resize(menu_slots.size() + 1)
	menu_slots[menu_slots.size() - 1] = MenuSlot.new()
	emit_signal("resize")
	insert(selection)
