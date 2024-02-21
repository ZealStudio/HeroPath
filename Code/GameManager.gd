extends Node





func GetPlayer():
	var player = get_tree().get_nodes_in_group("Player")
	if player:
		return player[0]
