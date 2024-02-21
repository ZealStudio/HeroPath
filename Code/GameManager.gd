extends Node

#emitted from EntranceToAreaTemplate
signal area_changed

signal player_moved

func GetPlayer():
	var player = get_tree().get_nodes_in_group("Player")
	if player:
		return player[0]
