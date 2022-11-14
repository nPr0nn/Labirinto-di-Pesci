extends Control
onready var Game = get_node("/root/Singleton") 

func _ready():
	$VBoxContainer/Back.grab_focus()
	pass 
	
func _on_Back_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_Mouse_Control_pressed():
	if($"VBoxContainer/Mouse Control".pressed == true):
		$"VBoxContainer/Keyboard Control".pressed = false
		Game.gameplay_type = Game.GAMEPLAY_TYPE.MOUSE
	elif($"VBoxContainer/Mouse Control".pressed == false):
		$"VBoxContainer/Mouse Control".pressed = true
	pass 

func _on_Keyboard_Control_pressed():
	if($"VBoxContainer/Keyboard Control".pressed == true):
		$"VBoxContainer/Mouse Control".pressed = false
		Game.gameplay_type = Game.GAMEPLAY_TYPE.KEYBOARD
	elif($"VBoxContainer/Keyboard Control".pressed == false):
		$"VBoxContainer/Keyboard Control".pressed = true
	pass # Replace with function body.
