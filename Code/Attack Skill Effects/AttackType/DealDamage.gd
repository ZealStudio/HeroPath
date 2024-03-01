extends Effect

class_name Damage


@export var baseAmount :int = 0
@export_enum("Physical","Magic") var Type: String


func  WhenUsed():
	DoDamage(Target)

func DoDamage(targetForAttack):
	var TotalDamage =0
	if Type =="Physical":
		TotalDamage += Self.WhoOwnsThisCard.Stat.PhysicalAttack
	if Type =="Magic":
		TotalDamage += Self.WhoOwnsThisCard.Stat.MagicAttack

	TotalDamage += baseAmount
	print_debug(targetForAttack)
	targetForAttack.WhoOwnsThisCard.TakeDamage(TotalDamage,Type)
