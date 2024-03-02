extends Node

signal dialog_initiated(dialogue)
signal dialog_finished

signal npc_interact

enum GameState {FREEWALK, IN_MENU, IN_DIALOG}

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
func GetPlayerStateMachine():
	var StateMachine=get_tree().get_nodes_in_group("StateMachine")
	if StateMachine:
		return StateMachine[0]
func GetEnemyGetCardHolder():
	var CardHolder =get_tree().get_nodes_in_group("EnemyGetCardHolder")
	if CardHolder:
		return CardHolder[0]
func GetEnemyUiHolder():
	var EnemyUiHolder =get_tree().get_nodes_in_group("EnemyUiHolder")
	if EnemyUiHolder:
		return EnemyUiHolder[0]
		#PlayerUnitHolderStat
func GetPlayerUiHolder():
	var PlayerUiHolder =get_tree().get_nodes_in_group("PlayerUiHolder")
	if PlayerUiHolder:
		return PlayerUiHolder[0]
func GetPlayerUnitHolder():
	var PlayerUnitHolder =get_tree().get_nodes_in_group("PlayerUnitHolderStat")
	if PlayerUnitHolder:
		return PlayerUnitHolder[0]



func emit_dialog_initiated(dialogue: Dialogue):
	call_deferred("emit_signal", "dialog_initiated", dialogue)


func emit_dialog_finished():
	call_deferred("emit_signal", "dialog_finished")
