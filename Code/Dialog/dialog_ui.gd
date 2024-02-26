extends Control

@export var avatar: TextureRect
@export var dialogue_text: Label
@export var current_dialogue_tres: Dialogue
@export var runtime_data: RuntimeData

var current_slide_index: int = 0

func _ready():
	#avatar.texture = current_dialogue_tres.avatar_texture
	show_slide()
	GameManager.connect("dialog_initiated", on_dialog_initiated)
	GameManager.connect("dialog_finished", on_dialog_finished)


func _input(event):
	if event.is_action_pressed("Interact"):
		if current_slide_index < current_dialogue_tres.dialog_slides.size() - 1:
			current_slide_index += 1
			show_slide()
		elif runtime_data.current_gameplay_state == GameManager.GameState.IN_DIALOG:
			GameManager.emit_dialog_finished()


func show_slide():
	if current_dialogue_tres.dialog_slides.size() > 0\
	 and current_dialogue_tres.avatars.size() > 0\
	 and current_dialogue_tres.dialog_slides.size() == current_dialogue_tres.avatars.size():
		dialogue_text.text = current_dialogue_tres.dialog_slides[current_slide_index]
		avatar.texture = current_dialogue_tres.avatars[current_slide_index]
	else:
		print_debug("Missing Dialogue AND/OR Avatar on Dialogue Resource")
		print_debug(current_dialogue_tres)


func on_dialog_finished():
	runtime_data.current_gameplay_state = GameManager.GameState.FREEWALK
	self.visible = false


func on_dialog_initiated(dialogue: Dialogue):
	runtime_data.current_gameplay_state = GameManager.GameState.IN_DIALOG
	current_dialogue_tres = dialogue
	current_slide_index = 0
	show_slide()
	self.visible = true
