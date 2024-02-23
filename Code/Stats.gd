extends Resource

class_name  UnitStats

@export_group("Basic Properties")
@export var Name : String
@export var Speed: int
@export var Sprite :Texture

@export_group("Level Properties")
@export var Level: int
var ExpForNextLevel:int
var CurrentExp: int

@export_group("Attack Properties")
@export var PhysicalAttack: int
@export var MagicAttack:int
#@export var AttackPattern : Array[Attacks]
#@export_enum("", "Mary", "Leah") var Att: String = "Rebecca"
@export_group("Health Properties")
@export var MaxHealth:int
@export var Health : int

@export_group("Health Properties")
@export var MaxMana:int
@export var Mana: int

@export_group("Defense Properties")
@export var PhysicalDefense: int
@export var MagicDefense: int





