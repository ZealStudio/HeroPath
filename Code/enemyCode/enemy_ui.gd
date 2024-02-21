extends  UnitUI

class_name  EnemyUI

@export var MonsterSprite :TextureRect
func _ready():
	super._ready()


func SetLabels():
	super.SetLabels()
	MonsterSprite.texture = Stats.Sprite

