extends Card

var FrameColor

@export var Background: Sprite2D
@export var CardFrames = {
	"Blue": Texture,
	"Red": Texture,
	"Pink": Texture,
	"Green": Texture
}




func _physics_process(delta):
	MoveCard(CurrentSpotOnBoard.global_position)

func  _ready():
	SetLabels()

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
		self.global_position.x = lerp(self.global_position.x, global_position.x +  150 ,.1)


func SetLabels():
	NameOfAtack.text =AbilityToMakeIntoCard.Name
	Background.texture = CardFrames[FrameColor]
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



