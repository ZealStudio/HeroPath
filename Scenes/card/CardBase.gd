extends Node2D
class_name Card


signal Use

@onready var OutlineValues =$BackGround.material
@export var NameOfAtack :RichTextLabel
@export var DescriptionOfAtack :RichTextLabel
@export var AttackToMakeIntoCard :Ability
var CurrentSpotOnBoard : Marker2D
var WhoOwnsThisCard : PlayerBase
var bIsSelected = false

var CardsToEffect ={"CardToRight": Card,
"CardToleft": Card}


func _physics_process(delta):
	MoveCard(CurrentSpotOnBoard.global_position)




func  _ready():
	SetLabels()
func Selected(bSelected:bool):
	if bSelected:
		OutlineValues.set_shader_parameter("width",1)
		bIsSelected = true
	else:
		OutlineValues.set_shader_parameter("width",0)
		bIsSelected = false

func ZoomIn():
	pass

func MoveCard(NewPosition ):
	self.global_position = lerp(self.global_position, NewPosition ,.1 )
func SetLabels():
	NameOfAtack.text =AttackToMakeIntoCard.Name

func OnUse():
	print_debug(NameOfAtack.text + " was used.")
	emit_signal("Use")
