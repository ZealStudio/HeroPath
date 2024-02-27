extends Resource


class_name  Effect


@export var Name : String
@export_enum("Self", "EnemySelected","TeamMateSelected", "RandomTeamMate","RandomTeamMate" ) var TargetType: String
@export_multiline var description: String
@export var Amount :int
var Target


func  WhenUsed():
	pass

func GetSelf():
	print(Target.name)



