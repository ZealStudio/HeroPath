extends Control

#default menu
@export var item_menu: PackedScene

@export var runtime_data: RuntimeData

var new_item_menu
var bIsOpen: bool = false

func _input(event):
	if event.is_action_pressed("i")\
	 and (runtime_data.current_gameplay_state == GameManager.GameState.FREEWALK\
	 or runtime_data.current_gameplay_state == GameManager.GameState.IN_MENU):
		if bIsOpen:
			close()
		else:
			open()


func open():
	bIsOpen = true
	new_item_menu = item_menu.instantiate()
	add_child(new_item_menu)
	runtime_data.current_gameplay_state = GameManager.GameState.IN_MENU


func close():
	bIsOpen = false
	remove_child(new_item_menu)
	runtime_data.current_gameplay_state = GameManager.GameState.FREEWALK
