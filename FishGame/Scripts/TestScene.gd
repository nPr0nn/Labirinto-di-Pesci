extends Node2D

var index_object_factory
var filhos
onready var object_factory = $objectFactory

func _ready():
	#object_factory.addObjectCol("box", 21, -187, 990, 64)
	#object_factory.addObjectCol("box", 21,  901, 990, 64)
	#object_factory.addObjectRow("box", 17, -187, 286, 64)
	object_factory.build_map()
	

func _process(_delta):
	if Input.is_key_pressed(KEY_K):
		get_child(index_object_factory).addObject("simpleEnemy2",0,0)

	if Input.is_action_pressed("spawnEnemy"):
		get_child(index_object_factory).addObject("simpleEnemy",0,0)
		
