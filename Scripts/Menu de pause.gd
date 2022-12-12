extends Control

var is_paused = false setget set_is_paused

func _ready():
	$CenterContainer/VBoxContainer/Resume.grab_focus()
	pass 

func _unhandled_input(event):
	if(event.is_action_pressed("pause")):
		self.is_paused = !is_paused
		
func set_is_paused(value):
	is_paused = value
	visible = is_paused
	get_tree().paused = is_paused

func _on_Resume_pressed():
	self.is_paused = false
	pass 

func _on_Options_pressed():
	get_child(2).visible = true
	pass 
	
func _on_Quit_pressed():
	self.is_paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass
