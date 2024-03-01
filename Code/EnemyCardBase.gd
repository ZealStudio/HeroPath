extends Card




func Selected(bSelected:bool):
	if bSelected:
		OutlineValues.set_shader_parameter("width",1)
		bIsSelected = true
	else:
		OutlineValues.set_shader_parameter("width",0)
		bIsSelected = false


		#if TimerForHover.wait_time:
			#bCanMoveUp = false

func MoveCard(NewPosition ):
	self.global_position = lerp(self.global_position, NewPosition ,.1 )



