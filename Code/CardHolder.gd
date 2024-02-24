extends Node2D


@export var PlayerUnitHolder : Node2D
@export var PositionHolder : Node2D
func _ready():
	CreateCards()

func  _physics_process(delta):
	pass
func CreateCards():
	var Units = PlayerUnitHolder.get_children()
	var Positions = PositionHolder.get_children()
	var Temp = 0
	for Unit in Units:
		for card in Unit.AddCardsToBattle():
			card.CurrentSpotOnBoard  =Positions[Temp]
			Temp+= 1
			$"..".GetButtonToUse()

