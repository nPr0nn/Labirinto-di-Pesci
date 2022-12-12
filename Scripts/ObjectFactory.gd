extends Node2D

onready var escala = 64
onready var Game = get_node("/root/Singleton")

var objetos = {"#" : 0,"B":0,"L" : 0,"F":0,".":0}
var models = { "BigEnemy": preload("res://Scenes/BigEnemy.tscn"),
				"LittleEnemy": preload("res://Scenes/LittleEnemy.tscn"),
				"box": preload("res://Scenes/Caixa.tscn"),
				"Food": preload("res://Scenes/Food.tscn")}
				
func _ready():
	pass

func set_scale(nova_escala):
	if(typeof(nova_escala) != TYPE_INT or nova_escala <= 0):
		print("Input inválido. Escala precisa ser um inteiro positivo")
		escala = null
		return false

	if(nova_escala > 2048):
		nova_escala = 2048
		
	escala = nova_escala
	return true
	
func get_scale():
	return escala

func load_map(file_path):
	var dados = []
	load_file("res://Data/mapa.txt", dados)
	return dados

func get_dim(dados):
	if(len(dados) == 0):
		return Vector2(0, 0)
	var dim = Vector2(len(dados[0]), len(dados));
	return dim 

func build_map(x,y,show=true,simbol="#",caminho = "mapa"):
	var dados = []
	
	if !File.new().file_exists("res://Data/"+caminho+".txt"):
		return "aquivo do mapa nao existe"


	load_file("res://Data/"+caminho+".txt", dados)

	var dim = get_dim(dados)

	for i in range(dim.y):
		for j in range(dim.x):
			if !show:
				objetos[dados[i][j]]+=1
			if dados[i][j] == "#":
				if show:
					addObject("box", j*escala+x, i*escala+y, dim*escala)
			if dados[i][j] == "B":
				if show:
					Game.addBoss()
					addObject("BigEnemy", j*escala+x, i*escala+y, dim*escala)
			if dados[i][j] == "L":
				if show:
					addObject("LittleEnemy", j*escala+x, i*escala+y, dim*escala) 
			if dados[i][j] == "F":
				if show:
					addObject("Food", j*escala+x, i*escala+y, dim*escala)
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

func addObject(type, x, y, world_limits, show=true):
	var object = models[type].instance()
	object.global_position = Vector2(x,y)
	
	if(object.global_position.x >= world_limits.x or object.global_position.x < 0):
		print("Posição inválida de spawn de objeto")
		object.free()
		return null

	if(object.global_position.y > world_limits.y ):
		print("Posição inválida de spawn de objeto")
		object.free()
		return null

	if show:
		add_child(object)
	
	return object

func _process(delta):
	pass
