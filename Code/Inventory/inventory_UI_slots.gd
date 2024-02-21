extends Panel

class_name ItemSlotBase

signal  OnUse(MenuToOpen)

@export var item_visual: Sprite2D
@export var amount_text: Label
#@export var ButtonLabel : Label
@export_color_no_alpha var NotSelectedColor: Color
@export_color_no_alpha var SelectedColor: Color
#@export var TextInLabel :String
#@export var MainMenuToOpen : BaseMenu
@export var BG: ColorRect

var bIsSelected = false

func _ready():
	item_visual.visible = false
	#ButtonLabel.text = TextInLabel


func Selected():
	if bIsSelected:
		BG.color = SelectedColor
		#ButtonLabel.set("theme_override_colors/font_color",NotSelectedColor)
	else :
		BG.color = NotSelectedColor
		#ButtonLabel.set("theme_override_colors/font_color",SelectedColor)


#func Press():
	#emit_signal("OnUse",MainMenuToOpen)


func update(slot: InventorySlot):
	if not slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			amount_text.visible = true
		amount_text.text = str(slot.amount)
