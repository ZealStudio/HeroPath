extends Effect


class_name  Move
@export var Directions: int



func  WhenUsed():
	MoveCard()


func  MoveCard():
	print_debug(Self)
	Target.SwitchCard(Self)
