extends UI_UnitHolder


class_name PlayerUi
var ColorForFrame
@export var BackGround : TextureRect
@export var labelMana : Label
@export var CardFrames = {
	"Blue": Texture,
	"Red": Texture,
	"Pink": Texture,
	"Green": Texture
}

func UpdateLabels():
	super.UpdateLabels()
	BackGround.texture = CardFrames[ColorForFrame]
	labelMana.text = str(Stats.Mana)
func ShowUiForATime(time):

	await get_tree().create_timer(time).timeout
	MovePoint = ReturnPoint
