extends Area2D

@export var runtime_data: RuntimeData

var shop_menu: PackedScene = preload("res://Code/Shop/shop_menu.tscn")
var new_shop

func _ready():
	GameManager.connect("shop_interact", shop_interact)


func shop_interact():
	if runtime_data.current_gameplay_state == GameManager.GameState.FREEWALK:
		new_shop = shop_menu.instantiate()
		get_parent().add_child(new_shop)
		runtime_data.current_gameplay_state = GameManager.GameState.IN_SHOP
	elif runtime_data.current_gameplay_state == GameManager.GameState.IN_SHOP:
		get_parent().remove_child(new_shop)
		runtime_data.current_gameplay_state = GameManager.GameState.FREEWALK
