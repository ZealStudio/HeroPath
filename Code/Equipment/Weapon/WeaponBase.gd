extends Equipment

class_name  Weapon


@export_enum("Sword", "Spear") var WeaponType: String

@export_group("Attack Properties")
@export var PhysicalAttack: int
@export var MagicAttack:int


@export_group("Attack List")
@export var  Attack : Array[Attacks]

@export_group("Skill List")
@export var  Skill : Array[Skills]

