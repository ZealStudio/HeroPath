extends StaticBody2D

@export var item: InventoryItem
var player = null

func _on_interactable_area_body_entered(body):
	if body.name == "player":
		player = body
		#needs to be implemented
		#player.collect(item) <------------
