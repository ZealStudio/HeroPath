extends UnitBase

class_name  Enemy

var CardBase = preload("res://Scenes/card/CardBase.tscn")
func  _ready():
	SetLabels()

func SetLabels():
	pass
func UpdateLabel():
	pass
func TakeDamage(Attack: Attacks ,Attacker:UnitStats):
	super.TakeDamage(Attack,Attacker)
	UpdateLabel()

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
		#attacks
		CardsToAdd.append(NewCard)
		EnemyCardHolder.add_child(NewCard)



	return CardsToAdd
