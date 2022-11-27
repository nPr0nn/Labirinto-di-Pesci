extends Control
onready var Game = get_node("/root/Singleton") 

func _ready():
	if(Game.gameplay_type == Game.GAMEPLAY_TYPE.MOUSE):
		$"VBoxContainer/Mouse Control".pressed = true
		$"VBoxContainer/Keyboard Control".pressed = false
	if(Game.gameplay_type == Game.GAMEPLAY_TYPE.KEYBOARD):
		$"VBoxContainer/Mouse Control".pressed = false
		$"VBoxContainer/Keyboard Control".pressed = true
	$VBoxContainer/Back.grab_focus()
	pass 
	
func _on_Back_pressed():
	visible = false

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
	pass 
