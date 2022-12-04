extends Node2D

onready var Game = get_node("/root/Singleton")

var models = { "BigEnemy": preload("res://Scenes/BigEnemy.tscn"),
				"LittleEnemy": preload("res://Scenes/LittleEnemy.tscn"),
				"box": preload("res://Scenes/Caixa.tscn") }


var escala = 64

func _ready():
	pass
	
func build_map(x,y):
	var dados = []
	load_file("res://Data/mapa.txt", dados)
	for i in range(len(dados)):
		for j in range(len(dados[i])):
			if dados[i][j] == "#":
				addObject("box", j*escala+x, i*escala+y)
			if dados[i][j] == "B":
				Game.addBoss()
				addObject("BigEnemy", j*escala+x, i*escala+y)
			if dados[i][j] == "L":
				addObject("LittleEnemy", j*escala+x, i*escala+y) 
	
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
	return enemy

func _process(delta):
	pass
