extends Control

@export var BG: ColorRect
@export var selection_name: Label
@export_color_no_alpha var NotSelectedColor: Color
@export_color_no_alpha var SelectedColor: Color

var bIsSelected = false

func update(menu_slot: AbilitySlot):
	if not menu_slot.ability:
		selection_name.visible = false
	else:
		selection_name.visible = true
		selection_name.text = menu_slot.ability.name


func Selected():
	if bIsSelected:
		BG.color = SelectedColor
	else:
		BG.color = NotSelectedColor

func Press(menu_slot: AbilitySlot):
	var new_scene = menu_slot.weapon.scene.instantiate()
	get_parent().get_parent().get_parent().get_parent().add_child(new_scene)
