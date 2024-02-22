extends UnitBase

class_name  Enemy

@export var NameLabel : RichTextLabel
@export var HealthLabel: RichTextLabel
@export var MonsterSprite :TextureRect
func  _ready():
	SetLabels()

func SetLabels():
	NameLabel.text =  "Lv " + str(Stat.Level) + ": " + Stat.Name
	HealthLabel.text = "Health: " + str(Stat.Health )
	MonsterSprite.texture = Stat.Sprite

func UpdateLabel():
	HealthLabel.text = "Health: " + str(Stat.Health )
func TakeDamage(Attack: Attacks ,Attacker:UnitStats):
	super.TakeDamage(Attack,Attacker)
	UpdateLabel()
