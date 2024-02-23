extends ButtonBase


class_name  AttackButtonUi
var Attack :Attacks
@export var DamageLabel:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func SetLabels(Damage:int, NameOfAttack):
	DamageLabel.text = str(Damage)
	ButtonLabel.text = NameOfAttack
func Selected():
	super.Selected()
	if bIsSelected:
		DamageLabel.set("theme_override_colors/font_color",NotSelectedColor)
	else :
		DamageLabel.set("theme_override_colors/font_color",SelectedColor)
func Press():
	var Player =  get_tree().get_nodes_in_group("PlayerStatHolder")[0]
	Player.EndTurn()
	print_debug("Attacked")
