extends Node

signal dialog_initiated(dialogue)
signal dialog_finished

signal npc_interact

enum GameState {FREEWALK, IN_MENU, IN_DIALOG}

func GetPlayer():
	var player = get_tree().get_nodes_in_group("Player")
	if player:
		return player[0]


func emit_dialog_initiated(dialogue: Dialogue):
	call_deferred("emit_signal", "dialog_initiated", dialogue)


func emit_dialog_finished():
	call_deferred("emit_signal", "dialog_finished")
