extends UnitBase

class_name  PlayerBase
var CardBase = preload("res://Scenes/card/CardBase.tscn")

func StartTurn():
	CanAct = true
func EndTurn():
	super.EndTurn()
	var BattleManager = get_tree().get_nodes_in_group("BattleManager")[0]
	BattleManager.ProgressBattle()
func AddCardsToBattle():
	var CardsToAdd = []
	if Stat.bIsDead:
		print_debug("Dead")
		return
	for attacks in Stat.WeaponSlot.Attack:
		var NewCard = CardBase.instantiate()
		NewCard.AttackToMakeIntoCard = attacks
		NewCard.WhoOwnsThisCard = self
		CardsToAdd.append(NewCard)
		GameManager.GetPlayerGetCardHolder().add_child(NewCard)
	return CardsToAdd
