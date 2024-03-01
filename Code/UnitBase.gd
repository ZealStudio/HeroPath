extends Node

class_name  UnitBase
# Called when the node enters the scene tree for the first time.

signal UpdateLabels
signal EndTurnSignal
@export var Stat :UnitStats
var CurretTarget :UnitBase

var CanAct = false







func TakeDamage(AttackAmount,Type ):
	var DamageAmount = AttackAmount
	DamageAmount = CheckDefense(AttackAmount,Type )
	Stat.Health -=	DamageAmount
	if Stat.Health <= 0:
		Stat.bIsAlive = false
		Stat.Health = 0
	emit_signal("UpdateLabels")


func CheckDefense(DamageAmount,Type):

	if Type ==" Magic" and DamageAmount > Stat.MagicDefense:
		return DamageAmount - Stat.MagicDefense
	else:
		return 0
	if  Type =="Physical" and DamageAmount  > Stat.Defense:
		return DamageAmount - Stat.PhysicalDefense
	else:
		return 0

func StartTurn():
	print_debug(Stat.Name + " Starts it's turn")
	pass
func EndTurn():
	CanAct = false
func FinshedAction():
	pass

