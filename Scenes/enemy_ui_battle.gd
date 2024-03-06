extends UI_UnitHolder

class_name EnemyUi
# Called when the node enters the scene tree for the first time.
@export var CardFrames = {
	"Blue": Texture,
	"Red": Texture,
	"Pink": Texture,
	"Green": Texture
}

func ShowUiForATime(time):

	await get_tree().create_timer(time).timeout
	MovePoint = ReturnPoint
