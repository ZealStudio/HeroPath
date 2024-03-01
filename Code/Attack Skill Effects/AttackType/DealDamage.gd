extends Effect

class_name Damage


@export var baseAmount :int = 0
@export_enum("PhysicalDamage","MagicDamage") var Type: String


func  WhenUsed():
	DoDamage(Target)

func DoDamage(targetForAttack):
	var TotalDamage =0
	if Type =="PhysicalDamage":
		TotalDamage += Self.WhoOwnsThisCard.Stat.PhysicalAttack
	if Type =="MagicDamage":
		TotalDamage += Self.WhoOwnsThisCard.Stat.MagicAttack

	TotalDamage += baseAmount
	print_debug(targetForAttack)
	targetForAttack.WhoOwnsThisCard.TakeDamage(TotalDamage,Type)
