extends Node2D
class_name Card


signal Use

@onready var TimerForHover = $HoverTimer
@onready var OutlineValues =$BackGround.material
@export var NameOfAtack :Label
@export var AbilityToMakeIntoCard :Ability



var CurrentSpotOnBoard : Marker2D
var WhoOwnsThisCard : UnitBase
var CardInBattleUi
var bIsSelected = false
var bCanMoveUp =false
var ownerUI
var NeighborCards ={"CardToRight": Card,
"CardToleft": Card}

func _physics_process(delta):
	MoveCard(CurrentSpotOnBoard.global_position)
	if bCanMoveUp:
		MoveWhenSelected()

func  _ready():
	SetLabels()



# for book in battle
func UpdateUi():
	CardInBattleUi.AbilityToMakeIntoUi = AbilityToMakeIntoCard
	CardInBattleUi.UpdateLabels()

func ShowUi(PointToMoveTo):
	CardInBattleUi.AbilityToMakeIntoUi = AbilityToMakeIntoCard
	CardInBattleUi.CurrentSpotOnBoard = PointToMoveTo
	CardInBattleUi.UpdateLabels()


func Selected(bSelected:bool):
	if bSelected:
		OutlineValues.set_shader_parameter("width",1)
		bIsSelected = true
		TimerForHover.start()
	else:
		OutlineValues.set_shader_parameter("width",0)
		bIsSelected = false
		TimerForHover.stop()
		bCanMoveUp = false
		#if TimerForHover.wait_time:
			#bCanMoveUp = false

func MoveCard(NewPosition ):
	self.global_position = lerp(self.global_position, NewPosition ,.1 )

func MoveWhenSelected():
	if bIsSelected:
		self.global_position.y = lerp(self.global_position.y, global_position.y -  150 ,.1)
	else :
		self.global_position.y = lerp(self.global_position.y, global_position.y  ,.1)


func SetLabels():
	NameOfAtack.text =AbilityToMakeIntoCard.Name
func OnUse():
	print_debug(NameOfAtack.text + " was used.")
	OnUseCallEffects()
	emit_signal("Use")
	return
func SetNeighborCards():

	var CardsInHolder = GameManager.GetPlayerGetCardHolder().get_children()
	var SizeOfArrary = CardsInHolder.size()
	if FindThisCardPosition() == 0:
		NeighborCards["CardToleft"] = null
	else:
		NeighborCards["CardToleft"] = CardsInHolder[FindThisCardPosition() - 1]
	if FindThisCardPosition() == SizeOfArrary -1:
		NeighborCards["CardToRight"] = null
	else:
		NeighborCards["CardToRight"] = CardsInHolder[FindThisCardPosition() + 1]

func FindThisCardPosition():
	var CardHolder = GameManager.GetPlayerGetCardHolder().get_children()
	var SelfIndex = CardHolder.find(self)
	return SelfIndex


func OnUseCallEffects():
	for effect in AbilityToMakeIntoCard.SkillEffects:
		effect.Self = self
		effect.Target = await SetTarget(effect.TargetType)
		await effect.WhenUsed()
	GameManager.GetPlayerStateMachine().ChangeState("pickability")



func OnBattleStartEffect():
	pass




func _on_hover_timer_timeout():
	bCanMoveUp = true



func SetTarget(Target):
	if Target == "Self":
		return GetSelfTarget()
	if  Target == "EnemyIndex":
		return GetEnemyIndex()
	if Target == "TeamMateIndex":
		return GetTeamMateIndex()
	if Target == "EnemySelected":
		return await GetSelectedEnemy()
	if Target == "TeamMateSelected":
		return await GetSelectedTeamMate()
	if Target == "RandomEnemy":
		return GetRandomEnemy()
	if Target == "RandomTeamMate":
		return GetRandomTeamMate()



func  SwitchCard(CardToSwitchTo):
	var PlayerCardholder =  GameManager.GetPlayerGetCardHolder()
	var Temp = 	self.CurrentSpotOnBoard
	var TempIndex = PlayerCardholder.get_children().find(self)
	var TempIndex2 = PlayerCardholder.get_children().find(CardToSwitchTo)
	#CardToSwitchTo.CurrentSpotOnBoard = self.CurrentSpotOnBoard
	print_debug()
	self.CurrentSpotOnBoard = CardToSwitchTo.CurrentSpotOnBoard
	CardToSwitchTo.CurrentSpotOnBoard = Temp


	print_debug(TempIndex)


	PlayerCardholder.move_child(CardToSwitchTo,TempIndex )
	PlayerCardholder.move_child(self,TempIndex2 )
	SetNeighborCards()
	CardToSwitchTo.SetNeighborCards()
	return



func GetSelfTarget():
	return self

func  GetEnemyIndex():
	pass
func  GetTeamMateIndex():

	var EnemyCardsInField = GameManager.GetEnemyGetCardHolder().get_children()

func  GetSelectedEnemy():
	var SignalToWaitFor = GameManager.GetPlayerStateMachine().GetState("pickenemycard").CardPicked
	GameManager.GetPlayerStateMachine().ChangeState("pickenemycard")
	GameManager.GetPlayerStateMachine().GetState("pickenemycard").GetButtonToUse()
	return await SignalToWaitFor
func GetSelectedTeamMate():
	var SignalToWaitFor = GameManager.GetPlayerStateMachine().GetState("pickteamcard").CardPicked
	GameManager.GetPlayerStateMachine().ChangeState("pickteamcard")
	GameManager.GetPlayerStateMachine().GetState("pickteamcard").GetButtonToUse()
	return await SignalToWaitFor
func GetRandomEnemy():
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randi_range(0, GameManager.GetEnemyGetCardHolder().get_children().size()-1)
	var EnemyCardsInField = GameManager.GetEnemyGetCardHolder().get_children()

	return EnemyCardsInField[ my_random_number]
func GetRandomTeamMate():
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randi_range(0, GameManager.GetPlayerGetCardHolder().get_children().size()-1)
	var TeamCardsInField = GameManager.GetPlayerGetCardHolder().get_children()
	return TeamCardsInField[my_random_number]

