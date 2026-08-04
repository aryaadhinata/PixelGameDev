extends CanvasLayer

@onready var button_save: Button = $VBoxContainer/ButtonSave
@onready var button_load: Button = $VBoxContainer/ButtonLoad

var is_paused : bool = false

func _ready() -> void:
	hide_paused_menu()
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("paused"):
		if is_paused == false :
			show_paused_menu()
		else:
			hide_paused_menu()
	
	get_viewport().set_input_as_handled()
	
	pass

func show_paused_menu() -> void :
	get_tree().paused = true
	visible = true
	is_paused = true
	
	pass

func hide_paused_menu() -> void :
	get_tree().paused = false
	visible = false
	is_paused = false
	
	
	pass
