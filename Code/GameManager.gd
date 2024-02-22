extends Node

signal show_slots

enum GameState {FREEWALK, IN_MENU, IN_DIALOG}

var state

func GetPlayer():
	var player = get_tree().get_nodes_in_group("Player")
	if player:
		return player[0]
