extends Node2D

onready var Game = get_node("/root/Singleton")

var models = { "BigEnemy": preload("res://Scenes/BigEnemy.tscn"),
				"LittleEnemy": preload("res://Scenes/LittleEnemy.tscn"),
				"box": preload("res://Scenes/Caixa.tscn"),
				"Food": preload("res://Scenes/Food.tscn")}

var objetos = {"#" : 0,"B":0,"L" : 0,"F":0,".":0}

var escala = 64

func _ready():
	pass

func build_map(x,y,show=true,simbol="#",caminho = "mapa"):
	var dados = []
	
	if !File.new().file_exists("res://Data/"+caminho+".txt"):
		return "aquivo do mapa nao existe"


	load_file("res://Data/"+caminho+".txt", dados)
	for i in range(len(dados)):
		for j in range(len(dados[i])):
			if !show:
				objetos[dados[i][j]]+=1
			if dados[i][j] == "#":
				if show:
					addObject("box", j*escala+x, i*escala+y)
			if dados[i][j] == "B":
				if show:
					Game.addBoss()
					addObject("BigEnemy", j*escala+x, i*escala+y)
			if dados[i][j] == "L":
				if show:
					addObject("LittleEnemy", j*escala+x, i*escala+y) 
			if dados[i][j] == "F":
				if show:
					addObject("Food", j*escala+x, i*escala+y)
	if !show:
		if simbol in objetos:
			return objetos[simbol]
		else:
			return 0
			
	
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
