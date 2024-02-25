extends  Effect

class_name  FindTarget



@export_enum("Self", "Enemy","TeamMate", "Random", ) var TargetType: String
var inputs = {


	"Self": GetSelfTarget(),
	"Enemy":  GetEnemyTarget(),
	"TeamMate": GetTeamMateTarget(),
	"EnemySelected":  GetSelectedEnemy(),
	"TeamMateSelected": Vector2.UP,
	"Random": Vector2.DOWN}







func  WhenUsed():
	return inputs[TargetType]



func GetSelfTarget():
	pass
func  GetEnemyTarget():
	pass
func  GetTeamMateTarget():
	pass
func  GetSelectedEnemy():
	pass
func TeamMateSelected():
	pass
func GetRandomEnemy():
	pass
func GetRandomTeamMate():
	pass
