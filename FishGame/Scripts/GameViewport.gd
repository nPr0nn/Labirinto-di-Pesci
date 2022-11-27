extends Node2D
onready var game = get_node("/root/Singleton")

func _ready():	
	game.viewport_container = $ViewportContainer
	game.viewport = $ViewportContainer/Viewport
#
#func _process(_delta):
#	if(Input.is_action_just_pressed("pause")):
#		get_child(1).visible = true
