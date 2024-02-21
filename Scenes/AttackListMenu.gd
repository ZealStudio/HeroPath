extends BaseMenu

var PlayerStat :PlayerStats


func _ready():
	MakeListOfAttacks()


func MakeListOfAttacks():
	PlayerStat = GameManager.GetPlayerStats()
	for  attack in PlayerStat.Attack:
		print_debug(attack.Name)

