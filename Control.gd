extends ButtonBase


class_name  AttackButtonUi
@export var DamageLabel:Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func SetLabels(Damage:int, NameOfAttack):
	DamageLabel.text = str(Damage)
	ButtonLabel.text = NameOfAttack
