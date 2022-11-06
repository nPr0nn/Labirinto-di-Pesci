extends Node2D

var models = {"simple": preload("res://Scenes/SimpleEnemy.tscn")}


func _ready():
	pass # Replace with function body.

func addEnemy(type,x,y):
	print("Quero spawnar")
	var enemy = models[type].instance()
	enemy.set_global_pos(x,y)
	add_child(enemy)

func _process(delta):
	if Input.is_action_pressed("spawnEnemy"):
		addEnemy("simple",100,100)
	
