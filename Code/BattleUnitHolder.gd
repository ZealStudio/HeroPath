extends Node
class_name  UI_UnitHolder


@export var Icon : Texture
@export var NameLabel:Label
@export var HealthLabel:Label
var WhoOwnsThisCard
var Stats :UnitStats
var ReturnPoint
var MovePoint

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateLabels()
	ReturnPoint = self.global_position
	MovePoint = ReturnPoint


func UpdateLabels():
	NameLabel.text = Stats.Name
	HealthLabel.text = str(Stats.Health)

func _physics_process(delta):
	ShowStats(MovePoint)


func ShowStats(NewPosition):
	self.global_position.y = lerp(self.global_position.y, NewPosition.y ,.1 )
