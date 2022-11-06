extends Node2D

var = enemyModel = preload("rea://Scenes/Enemy")

var objetos = Vector() #vetor de kinematic bodies


func _ready():
	pass # Replace with function body.

func removeObject(posElementoVetor):
	Vector[posElementoVetor].quere.free()


func addEnemy(x,y):
	var enemy = enemyModel.instance()
	tiro.set_global_pos(x,y)
	objetos.append(enemy)
	add_child(main)

func _process(delta):
	pass
