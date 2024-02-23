extends Resource


class_name Ability

@export_group("Basic Properties")
@export var Name :String
@export_enum("Magic", "Physical","True") var Type: String
@export var Cost :int
@export var MaxUse :int = 2
#@export var SoundForAttack :

@export_group("Skill Properties")
@export var AttackDamage :int
@export var Debuffs :Array[Effect]

func MakeDescription():
	pass
