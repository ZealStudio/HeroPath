extends Control



var Player
@export var MainMenu : BaseMenu
var Menus :Array[Node]


func _ready():
	Menus =  get_tree().get_nodes_in_group("BattleMenu")
	Player =  get_tree().get_nodes_in_group("PlayerStatHolder")[0]

func OpenMenu(MenuToOpen):
	for Menu in Menus:
		Menu.SetVisibility(false)
	var IndexOfMenuToOpen = Menus.find(MenuToOpen)
	Menus[IndexOfMenuToOpen].SetVisibility(true)



func _on_back_pressed():
	OpenMenu(MainMenu)
