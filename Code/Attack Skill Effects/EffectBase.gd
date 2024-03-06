extends Resource


class_name  Effect


@export var Name : String

#this can be 1-12
@export var targetNumberAmount :int
@export_enum("Self", "EnemySelected","TeamMateSelected", "RandomTeamMate","RandomEnemy","TeamMateIndex","EnemyIndex","UpOrDownEnemy","UpOrDownTeamMate" ) var TargetType: String
@export_multiline var description: String



var Self
var Target


func  WhenUsed():
	pass

func GetSelf():
	print(Target.name)



