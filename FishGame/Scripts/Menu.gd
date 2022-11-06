extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()
	pass # Replace with function body.

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/GameViewport.tscn")


func _on_Quit_pressed():
	get_tree().quit()
