extends Control


var Temp =0
func _ready():
	ProgressBattle()

func RunFromBattle():
	print_debug("End battle")


func ProgressBattle():
	var UnitsInPlay =  get_tree().get_nodes_in_group("BattleUnit")
	#UnitsInPlay = sort_units_by_speed(UnitsInPlay).duplicate(false)
	print_debug("new Round started")
	WholeBattleManager(UnitsInPlay)
func  WholeBattleManager(Units:Array):
	print(Temp)
	var CurrentUnit = Units[Temp]
	Temp +=1
	if Temp == Units.size():
		Temp =0
	CurrentUnit.StartTurn()




func sort_units_by_speed(units: Array) -> Array:
	# Sort the units based on their speed attribute in descending order
	units.sort_custom( _compare_units_by_speed)

	return units

# Comparison function for sorting units by speed
func _compare_units_by_speed(unit1, unit2) -> int:
	if unit1.Stat.Speed < unit2.Stat.Speed:
		return 1
	elif unit1.Stat.Speed > unit2.Stat.Speed:
		return -1
	else:
		return 0
