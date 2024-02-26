extends Area2D

@export var npc_resource: NPCBasicResource
@export var runtime_data: RuntimeData

enum npc_interact_state {INITIAL, POST}

var current_state

func _ready():
	GameManager.connect("npc_interact", npc_interact)
	current_state = npc_interact_state.INITIAL


func npc_interact(inventory):
	if current_state == npc_interact_state.INITIAL:
		GameManager.emit_dialog_initiated(npc_resource.initial_dialogue)
		current_state = npc_interact_state.POST
	elif current_state == npc_interact_state.POST:
		GameManager.emit_dialog_initiated(npc_resource.post_dialogue)

