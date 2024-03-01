extends UnitBase

class_name  Enemy
var Unitbase = preload("res://Scenes/enemy_ui_battle.tscn")
var CardBase = preload("res://Scenes/enemyCard.tscn")
func  _ready():
	pass
func SetLabels():
	pass
func UpdateLabel():
	pass
func StartTurn():
	pass
func AddCardsToBattle():
	var EnemyCardHolder = GameManager.GetEnemyGetCardHolder()
	var CardsToAdd = []
	if Stat.bIsDead:
		print_debug("Dead")
		return
		#CardsToEffect ={"CardToRight": Card,
		#"CardToleft": Card}
	for attacks in Stat.OnUse:
		var NewCard = CardBase.instantiate()
		NewCard.AbilityToMakeIntoCard = attacks
		NewCard.WhoOwnsThisCard = self
		NewCard.ownerUI = GetUi()
		self.UpdateLabels.connect(NewCard.ownerUI.UpdateLabels)
		#attacks
		CardsToAdd.append(NewCard)
		EnemyCardHolder.add_child(NewCard)



	return CardsToAdd
func GetUi():
	var UiHolder = GameManager.GetEnemyUiHolder()
	var UiForPlayer = Unitbase.instantiate()
	UiForPlayer.Stats = self.Stat
	UiHolder.add_child(UiForPlayer)

	return UiForPlayer

