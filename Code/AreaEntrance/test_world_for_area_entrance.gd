extends Node2D

@export var current_area_resource: EverythingInArea

func _ready():
	GameManager.connect("area_changed", change_area)
	#set current_area_resource to starting area


func change_area(area_resource: EverythingInArea):
	current_area_resource = area_resource
