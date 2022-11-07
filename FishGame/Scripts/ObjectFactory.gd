extends Node2D

var models = { "simpleEnemy2": preload("res://Scenes/SimpleEnemy2.tscn"),
				"simpleEnemy": preload("res://Scenes/SimpleEnemy.tscn"),
				"box": preload("res://Scenes/Caixa.tscn") }

func _ready():
	pass

func addObjectCol(type, number_of_objects, row, col, size):
	for i in range(number_of_objects):
		addObject(type, row, size*i - col) 

func addObjectRow(type, number_of_objects, row, col, size):
	for i in range(number_of_objects):
		addObject(type, row + i*size, col) 

func addObject(type,x,y):
	var enemy = models[type].instance()
	enemy.global_position = Vector2(x,y)
	add_child(enemy)

func _process(delta):
	pass
