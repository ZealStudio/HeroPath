extends BaseMenu

var PlayerStat :PlayerStats
var Holder= preload("res://Scenes/attack_holder.tscn")

func _ready():
	MakeListOfAttacks()


func MakeListOfAttacks():
	PlayerStat = GameManager.GetPlayerStats()
	for  attack in PlayerStat.Attack:
		var NewAttack = Holder.instantiate()
		NewAttack.Attack = attack
		NewAttack.SetLabels(attack.TotalDamage(),attack.Name)
		add_child(NewAttack)
