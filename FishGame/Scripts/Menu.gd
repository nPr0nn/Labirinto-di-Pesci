extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()
	pass 

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/GameViewport.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")

func _on_Quit_pressed():
	get_tree().quit()
