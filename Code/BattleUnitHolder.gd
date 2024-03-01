extends Node
class_name  UI_UnitHolder


@export var Icon : Texture
@export var NameLabel:Label
@export var HealthLabel:Label
var WhoOwnsThisCard
var Stats :UnitStats


# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateLabels()


func UpdateLabels():
	NameLabel.text = Stats.Name
	HealthLabel.text = str(Stats.Health)
