extends Effect


class_name  Move
@export var Directions: int



func  WhenUsed():
	MoveCard()


func  MoveCard():
	Target.SwitchCard(Self)
