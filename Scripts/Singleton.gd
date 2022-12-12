extends Node

# Window dimension
var size = Vector2(256, 144)
var window_scale: float = (OS.window_size/size).x

# Viewport
var viewport_container = null
var viewport = null 

# Gameplay
enum GAMEPLAY_TYPE {MOUSE, KEYBOARD}
var gameplay_type = GAMEPLAY_TYPE.MOUSE
var bosses = 0

func addBoss():
	bosses +=1

func bossKill():
	bosses -=1
	print(bosses)
	if bosses == 0:
		get_tree().change_scene("res://Scenes/Victory.tscn")
