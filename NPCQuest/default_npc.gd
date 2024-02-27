extends Area2D

@export var npc_resource: DefaultNPCResource
@export var runtime_data: RuntimeData

enum npc_interact_state {INTRO, PENDING, COMPLETE}

var current_state

func _ready():
	GameManager.connect("npc_interact", npc_interact)
	current_state = npc_interact_state.INTRO


func npc_interact(inventory):
	#inventory.slots.has(npc_resource.quest_item)
	#add amount of items requirement as well
	var correct_item = inventory.slots.filter(func(slot): return slot.item == npc_resource.quest_item)
	if not correct_item.is_empty()\
	 and current_state == npc_interact_state.PENDING:
		current_state = npc_interact_state.COMPLETE
	
	if current_state == npc_interact_state.INTRO:
		GameManager.emit_dialog_initiated(npc_resource.intro_dialogue)
		current_state = npc_interact_state.PENDING
	elif current_state == npc_interact_state.PENDING:
		GameManager.emit_dialog_initiated(npc_resource.pending_dialogue)
	elif current_state == npc_interact_state.COMPLETE:
		GameManager.emit_dialog_initiated(npc_resource.complete_dialogue)


	
