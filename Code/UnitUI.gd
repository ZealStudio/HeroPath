extends Node

class_name  UnitUI


@export var Stats : UnitStats
@export var NameLabel : RichTextLabel
@export var HealthLabel: RichTextLabel

func  _ready():
	SetLabels()

func SetLabels():
	NameLabel.text =  "Lv " + str(Stats.Level) + ": " + Stats.Name
	HealthLabel.text = "Health: " + str(Stats.Health )


func UpdateLabel():
	HealthLabel.text = "Health: " + str(Stats.Health )
