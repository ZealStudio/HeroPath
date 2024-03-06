extends Resource


class_name Ability

@export_group("Basic Properties")
@export var Name :String
@export var ApCost :int
@export var ManaCost: int
@export var HealthCost: int
@export var MaxUse :int = 2

#@export var SoundForAttack :
@export_group("Skill Properties")
@export var AttackDamage :int
@export_multiline var description: String
@export var SkillEffects :Array[Effect]


func MakeDescription():
	pass






