extends ColorRect



func _ready():
	StartBattle()


func StartBattle():
	material["shader_parameter/progress"] = 1.0

	var tween = create_tween()
	tween.tween_property(
		material,
		"shader_parameter/progress",
		1.0,
		1.8
	).from(0.0).set_trans(Tween.TRANS_SINE)

	await tween.finished
	tween = create_tween()
	tween.tween_property(
		material,
		"shader_parameter/progress",
		0,
		1
	).from(1.0).set_trans(Tween.TRANS_SINE)
	print_debug(" Start battle")
	#get_tree().change_scene_to_file("res://Scenes/main.tscn")
