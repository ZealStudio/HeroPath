extends UnitBase

class_name  PlayerBase
var CardBase = preload("res://Scenes/card/CardBase1.tscn")

func StartTurn():
	CanAct = true
func EndTurn():
	super.EndTurn()
	var BattleManager = get_tree().get_nodes_in_group("BattleManager")[0]
	BattleManager.ProgressBattle()
func AddCardsToBattle():
	var PlayerCardHolder = GameManager.GetPlayerGetCardHolder()
	var CardsToAdd = []
	if Stat.bIsDead:
		print_debug("Dead")
		return
		#CardsToEffect ={"CardToRight": Card,
		#"CardToleft": Card}


	for attacks in Stat.WeaponSlot.Attack:
		var NewCard = CardBase.instantiate()
		NewCard.AttackToMakeIntoCard = attacks
		NewCard.WhoOwnsThisCard = self
		CardsToAdd.append(NewCard)
		PlayerCardHolder.add_child(NewCard)



	return CardsToAdd
