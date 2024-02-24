extends Node

enum GameState {FREEWALK, IN_MENU, IN_DIALOG}

var state

func GetPlayer():
	var player = get_tree().get_nodes_in_group("Player")
	if player:
		return player[0]
func GetPlayerStats():
	var playerStats =get_tree().get_nodes_in_group("PlayerStatHolder")
	if playerStats:
		return playerStats[0].Stat
func GetPlayerGetCardHolder():
	var CardHolder =get_tree().get_nodes_in_group("PlayerGetCardHolder")
	if CardHolder:
		return CardHolder[0]
