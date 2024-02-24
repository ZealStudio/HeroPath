extends Ability

class_name  Attacks

@export_enum("Magic", "Physical") var Type: String

func TotalDamage():
	if Type =="Magic":
		return GameManager.GetPlayerStats().MagicAttack + AttackDamage
	elif  Type =="Physical":
		return GameManager.GetPlayerStats().PhysicalAttack + AttackDamage
	elif  Type =="True":
		return   AttackDamage
