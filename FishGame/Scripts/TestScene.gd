extends Node2D

onready var object_factory = $objectFactory

func _ready():
	var dados = object_factory.load_map("res://Data/mapa.txts")
	object_factory.build_map(0,-1186, dados)
	pass
	
# func _process(_delta):
	# if Input.is_key_pressed(KEY_K):
		# object_factory.addObject("simpleEnemy2",0,0)

	# if Input.is_action_pressed("spawnEnemy"):
		# object_factory.addObject("simpleEnemy",0,0)
		
