extends Resource

class_name  Attacks


@export_group("Basic Properties")
@export var Name :String
@export_enum("Magic", "Physical","True") var Type: String
#@export var SoundForAttack :

@export_group("Attack Properties")
@export var AttackDamage :int
@export var Debuffs :Array[Effect]



