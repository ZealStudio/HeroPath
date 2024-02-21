extends Panel

@export var item_visual: Sprite2D
@export var amount_text: Label

func update(slot: InventorySlot):
	if not slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			amount_text.visible = true
		amount_text.text = str(slot.amount)
