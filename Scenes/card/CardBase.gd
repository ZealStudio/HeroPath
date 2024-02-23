extends Node2D
class_name Card

@onready var OutlineValues =$BackGround.material
@export var NameOfAtack :RichTextLabel
@export var DescriptionOfAtack :RichTextLabel
@export var AttackToMakeIntoCard :Ability


func Selected(IsSelected:bool):
	if IsSelected:
		OutlineValues.set_shader_parameter("width",1)
	else:
		OutlineValues.set_shader_parameter("width",0)



func SetLabels():
	pass
