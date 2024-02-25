extends  Effect

class_name  FindTarget



@export_enum("Self", "Enemy","TeamMate", "Random", ) var TargetType: String
var inputs = {


	"Self": GetTarget(),
	"Enemy": Vector2.LEFT,
	"TeamMate": Vector2.UP,
	"SelfIndexBased": Vector2.RIGHT,
	"EnemyIndexBased": Vector2.LEFT,
	"TeamMateIndexBased": Vector2.UP,
	"Random": Vector2.DOWN}







func  WhenUsed():
	return GetTarget()

func GetTarget():
	if TargetType == "self":
		pass
