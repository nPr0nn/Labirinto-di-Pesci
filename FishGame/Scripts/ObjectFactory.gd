extends Node2D

var models = {"simple": preload("res://Scenes/SimpleEnemy.tscn")}
var spawnar = true

func _ready():
	pass # Replace with function body.

func addEnemy(type,x,y):
	print("Quero spawnar")
	var enemy = models[type].instance()
	print(enemy.global_position)
	add_child(enemy)

func _process(delta):
	if Input.is_action_pressed("spawEnemy"):
		if spawnar == true:
			print("printar")
			spawnar = false
			addEnemy("simple",100,100)
