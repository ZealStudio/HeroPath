extends Equipment

class_name  Weapon



@export_group("Attack Properties")
@export var PhysicalAttack: int
@export var MagicAttack:int


@export var OnUse: Array[Attacks]
@export var OnBattleStart:Array[Attacks]
