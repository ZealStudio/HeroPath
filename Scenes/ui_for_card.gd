extends Sprite2D

@export var AbilityToMakeIntoUi :Ability
@export var NameOfAttack: Label
@export var Type: Label
@export var Description: Label



@export var CurrentSpotOnBoard : Marker2D
var WhoOwnsThisCard : UnitBase
var CardInBattleUi


func UpdateLabels():
	NameOfAttack.text = AbilityToMakeIntoUi.Name
	Description.text = AbilityToMakeIntoUi.description


func  _physics_process(delta):
	MoveCard(CurrentSpotOnBoard.global_position)

func MoveCard(NewPosition ):
	self.global_position = lerp(self.global_position, NewPosition ,.1 )

