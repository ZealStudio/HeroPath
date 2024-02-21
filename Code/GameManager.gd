extends Node

#emitted from EntranceToAreaTemplate
signal area_changed

func GetPlayer():
	var player = get_tree().get_nodes_in_group("Player")
	if player:
		return player[0]
