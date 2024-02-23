extends UnitBase

class_name  PlayerBase


func StartTurn():
	CanAct = true
func EndTurn():
	super.EndTurn()
	var BattleManager = get_tree().get_nodes_in_group("BattleManager")[0]
	BattleManager.ProgressBattle()
