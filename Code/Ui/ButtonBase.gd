extends ColorRect

class_name  ButtonBase


signal  OnUse(MenuToOpen)
var bIsSelected = false
@export var ButtonLabel : Label
@export_color_no_alpha var NotSelectedColor: Color
@export_color_no_alpha var SelectedColor: Color
@export var TextInLabel :String
@export var MainMenuToOpen : BaseMenu

func _ready():
	ButtonLabel.text = TextInLabel
func Selected():
	if bIsSelected:
		color = SelectedColor
		ButtonLabel.set("theme_override_colors/font_color",NotSelectedColor)
	else :
		color = NotSelectedColor
		ButtonLabel.set("theme_override_colors/font_color",SelectedColor)
func Press():
	emit_signal("OnUse",MainMenuToOpen)
	print_debug("Pressd")
