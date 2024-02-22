extends Node

class_name  UnitUI


@export var Stat : UnitStats
@export var NameLabel : RichTextLabel
@export var HealthLabel: RichTextLabel

func  _ready():
	SetLabels()

func SetLabels():
	NameLabel.text =  "Lv " + str(Stat.Level) + ": " + Stat.Name
	HealthLabel.text = "Health: " + str(Stat.Health )


func UpdateLabel():
	HealthLabel.text = "Health: " + str(Stat.Health )
