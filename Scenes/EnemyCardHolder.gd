extends Node2D


@export var EnemyUnitHolder : Node2D
@export var EnemyPositionHolder : Node2D
func _ready():
	CreateCards()

func  _physics_process(delta):
	pass
func CreateCards():
	var Units = EnemyUnitHolder.get_children()
	var Positions = EnemyPositionHolder.get_children()
	var Temp = 0
	var TempForUi =0
	for Unit in Units:

		for card in Unit.AddCardsToBattle():
			card.CurrentSpotOnBoard  =Positions[Temp]
			Temp+= 1
			card.ownerUI.global_position = Vector2(450+ TempForUi * 150,-200 )
		TempForUi +=1
		#$"../../State Machine/PickAbility".GetButtonToUse()
	get_tree().call_group("ability", "SetNeighborCards")
func SwitchCardsAround():
	pass
