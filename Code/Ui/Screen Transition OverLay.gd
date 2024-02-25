extends ColorRect

signal  LoadBattleUI(CanBeSeen)

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
	emit_signal("LoadBattleUI", true)
	tween = create_tween()
	tween.tween_property(
		material,
		"shader_parameter/progress",
		0,
		1
	).from(1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished

	print_debug(" Start battle")




	#get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_mouse_entered():
	print_debug("enter ")
