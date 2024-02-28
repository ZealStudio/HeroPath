extends Node
class_name  UI_UnitHolder


@export var Icon : Texture
@export var NameLabel:Label
@export var HealthLabel:Label

var Unitstats :UnitBase


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func UpdateLabels():
	NameLabel.text = Unitstats.Name

