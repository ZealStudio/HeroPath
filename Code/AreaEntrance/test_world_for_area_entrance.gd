extends Node2D

@export var current_area_resource: EverythingInArea

var rng = RandomNumberGenerator.new()
var mercy_rule

func _ready():
	GameManager.connect("area_changed", change_area)
	GameManager.connect("player_moved", player_moved)
	#set current_area_resource to starting area
	
	


func change_area(area_resource: EverythingInArea):
	current_area_resource = area_resource


func player_moved():
	#if you go into battle set mercy_rule to some value
	if current_area_resource.mercy_rule > 0:
		current_area_resource.mercy_rule -= 0
	var rand_chance = rng.randi_range(0, current_area_resource.enemy_spawn_chance)
	if rand_chance == current_area_resource.enemy_spawn_chance\
	 and current_area_resource.mercy_rule == 0:
		var rand_enemy_index = rng.randi_range(0, current_area_resource.enemy_types.size())
		#go into battle with current_area_resource.enemy_types[rand_enemy_index]
