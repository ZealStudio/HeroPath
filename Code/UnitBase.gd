extends Node

class_name  UnitBase
# Called when the node enters the scene tree for the first time.


signal EndTurnSignal
@export var Stat :UnitStats
var CurretTarget :UnitBase
var bDead = false
var CanAct = false







func TakeDamage(Attack: Attacks ,Attacker:UnitStats):
	var DamageAmount = Attack.AttackDamage
	DamageAmount = CheckDefense(DamageAmount,Attack.Type, Attacker)
	Stat.Health -=	DamageAmount




func CheckDefense(DamageAmount, Type ,Attacker:UnitStats):

	if Type ==" Magic" and DamageAmount +Attacker.MagicAttack > Stat.MagicDefense:
		return DamageAmount - Stat.MagicDefense +Attacker.MagicAttack
	else:
		return 0
	if  Type =="Physical" and DamageAmount +Attacker.PhysicalAttack > Stat.Defense:
		return DamageAmount - Stat.PhysicalDefense +Attacker.PhysicalAttack
	else:
		return 0

func EndTurn():
	emit_signal("EndTurnSignal")
	print_debug(name +" turn has ended")
	CanAct = false
func FinshedAction():
	pass

