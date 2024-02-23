extends Ability

class_name  Attacks



func TotalDamage():
	if Type =="Magic":
		return GameManager.GetPlayerStats().MagicAttack + AttackDamage
	elif  Type =="Physical":
		return GameManager.GetPlayerStats().PhysicalAttack + AttackDamage
	elif  Type =="True":
		return   AttackDamage
