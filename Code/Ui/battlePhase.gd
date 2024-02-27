extends Control


var Temp =0
func _ready():
	ProgressBattle()

func RunFromBattle():
	pass


func ProgressBattle():
	var UnitsInPlay =  get_tree().get_nodes_in_group("BattleUnit")
	#UnitsInPlay = sort_units_by_speed(UnitsInPlay).duplicate(false)
	WholeBattleManager(UnitsInPlay)
func  WholeBattleManager(Units:Array):
	var CurrentUnit = Units[Temp]
	Temp +=1
	if Temp == Units.size():
		Temp =0
	CurrentUnit.StartTurn()





