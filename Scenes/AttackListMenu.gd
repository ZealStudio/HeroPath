extends BaseMenu

var PlayerStat :PlayerStats
var Holder= preload("res://Scenes/attack_holder.tscn")

func _ready():
	MakeListOfAttacks()


func MakeListOfAttacks():
	PlayerStat = GameManager.GetPlayerStats()
	for  attack in PlayerStat.Attack:
		print_debug(attack.Name)
		var NewAttack = Holder.instantiate()
		NewAttack.SetLabels(attack.TotalDamage(),attack.Name)
		add_child(NewAttack)
