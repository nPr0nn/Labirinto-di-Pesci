extends Node2D
onready var game = get_node("/root/Singleton")

func _ready():	
	game.viewport_container = $ViewportContainer
	game.viewport = $ViewportContainer/Viewport
	
