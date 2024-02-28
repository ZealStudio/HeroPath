extends UnitBase

class_name  PlayerBase
var CardBase = preload("res://Scenes/card/CardBase.tscn")
func StartTurn():
	CanAct = true

func AddCardsToBattle():
	var PlayerCardHolder = GameManager.GetPlayerGetCardHolder()
	var CardsToAdd = []
	if Stat.bIsDead:
		print_debug("Dead")
		return
		#CardsToEffect ={"CardToRight": Card,
		#"CardToleft": Card}
	for attacks in Stat.WeaponSlot.OnUse:
		var NewCard = CardBase.instantiate()
		NewCard.AbilityToMakeIntoCard = attacks
		NewCard.WhoOwnsThisCard = self
		#attacks
		CardsToAdd.append(NewCard)
		PlayerCardHolder.add_child(NewCard)



	return CardsToAdd






