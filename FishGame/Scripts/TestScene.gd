extends Node2D

var index_object_factory = 4

func _ready():
	get_child(index_object_factory).addObjectCol("box", 21, -187, 990, 64)
	get_child(index_object_factory).addObjectCol("box", 21,  901, 990, 64)
	get_child(index_object_factory).addObjectRow("box", 17, -187, 286, 64)

func _process(delta):
	if Input.is_key_pressed(KEY_K):
		get_child(index_object_factory).addObject("simpleEnemy2",0,0)

	if Input.is_action_pressed("spawnEnemy"):
		get_child(index_object_factory).addObject("simpleEnemy",0,0)
