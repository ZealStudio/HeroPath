extends Node2D
class_name Card


signal Use

@onready var TimerForHover = $HoverTimer
@onready var OutlineValues =$BackGround.material
@export var NameOfAtack :RichTextLabel
@export var DescriptionOfAtack :RichTextLabel
@export var AttackToMakeIntoCard :Ability
var CurrentSpotOnBoard : Marker2D
var WhoOwnsThisCard : PlayerBase
var bIsSelected = false
var bCanMoveUp =false
var NeighborCards ={"CardToRight": Card,
"CardToleft": Card}


func _physics_process(delta):
	MoveCard(CurrentSpotOnBoard.global_position)
	if bCanMoveUp:
		MoveWhenSelected()
func  _ready():
	SetLabels()
func Selected(bSelected:bool):
	if bSelected:
		OutlineValues.set_shader_parameter("width",1)
		bIsSelected = true
		TimerForHover.start()
	else:
		OutlineValues.set_shader_parameter("width",0)
		bIsSelected = false
		TimerForHover.stop()
		bCanMoveUp = false
		#if TimerForHover.wait_time:
			#bCanMoveUp = false

func ZoomIn():
	pass

func MoveCard(NewPosition ):
	self.global_position = lerp(self.global_position, NewPosition ,.1 )

func MoveWhenSelected():
	if bIsSelected:
		self.global_position.y = lerp(self.global_position.y, global_position.y -  150 ,.1)
	else :
		self.global_position.y = lerp(self.global_position.y, global_position.y  ,.1)

func SetLabels():
	NameOfAtack.text =AttackToMakeIntoCard.Name

func OnUse():
	print_debug(NameOfAtack.text + " was used.")
	emit_signal("Use")

func SetNeighborCards():

	var CardsInHolder = GameManager.GetPlayerGetCardHolder().get_children()
	var SizeOfArrary = CardsInHolder.size()
	if FindThisCardPosition() == 0:
		NeighborCards["CardToleft"] = null
	else:
		NeighborCards["CardToleft"] = CardsInHolder[FindThisCardPosition() - 1]
	if FindThisCardPosition() == SizeOfArrary -1:
		NeighborCards["CardToRight"] = null
	else:
		NeighborCards["CardToRight"] = CardsInHolder[FindThisCardPosition() + 1]
		print_debug(NeighborCards["CardToRight"].AttackToMakeIntoCard.Name)
func FindThisCardPosition():
	var CardHolder = GameManager.GetPlayerGetCardHolder().get_children()
	var SelfIndex = CardHolder.find(self)
	return SelfIndex

func _on_hover_timer_timeout():
	bCanMoveUp = true
