extends Area2D

@export var area_resource: EverythingInArea

func _ready():
	#testing
	GameManager.emit_signal("area_changed", area_resource)


func _on_area_entered(area):
	if area.is_in_group("Player"):
		GameManager.emit_signal("area_changed", area_resource)
