extends Node2D

var models = { "simpleEnemy2": preload("res://Scenes/SimpleEnemy2.tscn"),
				"simpleEnemy": preload("res://Scenes/SimpleEnemy.tscn"),
				"box": preload("res://Scenes/Caixa.tscn") }


var escala = 64

func _ready():
	pass
	
func get_type():
	return "objectFactory"
	
func build_map():
	var dados = []
	load_file("res://Data/mapa.txt", dados)
	for i in range(len(dados)):
		for j in range(len(dados[i])):
			if dados[i][j] == "#":
				addObject("box", j*escala-187, i*escala-1186) 
	
func load_file(file, dados):

	var f = File.new()
	f.open(file, File.READ)
	while not f.eof_reached():
		dados.append(f.get_line())
	f.close()
	return

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
