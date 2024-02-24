extends BaseMenu

var PlayerStat :PlayerStats
var Holder= preload("res://Scenes/attack_holder.tscn")
@export var Skillholder : GridContainer

func _ready():
	#MakeListOfAttacks()
	pass

func MakeListOfAttacks():
	PlayerStat = GameManager.GetPlayerStats()
	for  attack in PlayerStat.Attack:

		var NewAttack = Holder.instantiate()
		NewAttack.Attack = attack
		NewAttack.SetLabels(attack.TotalDamage(),attack.Name)
		Skillholder.add_child(NewAttack)
