extends Node

class_name  UnitUI


@export var Stats : UnitStats
@export var NameLabel : RichTextLabel


func  _ready():
	SetLabels()

func SetLabels():
	NameLabel.text =  "Lv " + str(Stats.Level) + ": " + Stats.Name
