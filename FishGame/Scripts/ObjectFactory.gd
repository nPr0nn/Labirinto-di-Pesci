extends Node2D

var models = {"simpleEnemy": preload("res://Scenes/SimpleEnemy.tscn"),"box": preload("res://Scenes/Caixa.tscn")}

func _ready():
	for i in range(21):
		addObject("box",-187,i*64-990)
		addObject("box",901,i*64-990)
		
	
	for i in range(17):
		addObject("box",-187+i*64,286)

func addObject(type,x,y):
	var enemy = models[type].instance()
	enemy.global_position = Vector2(x,y)
	add_child(enemy)

func _process(delta):
	if Input.is_action_pressed("spawnEnemy"):
		addObject("simpleEnemy",0,0)
