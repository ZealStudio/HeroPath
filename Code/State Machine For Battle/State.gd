extends Node
class_name State
@export var StateMachine:Node
signal  Transitioned

func  Enter():
	pass
func Exit():
	pass
func  Update(_delta:float):
	pass
func Physics_Update(_delta:float):
	pass
func Unhandled_input(event):
	pass
