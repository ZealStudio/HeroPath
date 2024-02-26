extends Control

@export var BG: ColorRect
@export var selection_name: Label
@export_color_no_alpha var NotSelectedColor: Color
@export_color_no_alpha var SelectedColor: Color

var bIsSelected = false

func update(menu_slot: MenuSlot):
	pass


func Selected():
	if bIsSelected:
		BG.color = SelectedColor
	else :
		BG.color = NotSelectedColor
