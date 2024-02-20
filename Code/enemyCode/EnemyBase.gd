extends UnitBase

class_name  Enemy

@onready var ImageSprite = $MonsterImage





func _ready():
	ImageSprite.texture = Stat.Sprite
