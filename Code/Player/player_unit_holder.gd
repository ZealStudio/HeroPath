extends UI_UnitHolder


class_name PlayerUi
var ColorForFrame
@export var BackGround : TextureRect
@export var CardFrames = {
	"Blue": Texture,
	"Red": Texture,
	"Pink": Texture,
	"Green": Texture
}

func UpdateLabels():
	super.UpdateLabels()
	BackGround.texture = CardFrames[ColorForFrame]

