extends "res://addons/gut/test.gd"

var _bigEnemy = load("res://Scripts/FishEnemyBody2.gd")
var _littleEnemy = load("res://Scripts/simpleEnemy.gd")
var bigEnemy
var littleEnemy
var dano
var resultado
func before_each():
	bigEnemy = _bigEnemy.new()
	littleEnemy = _littleEnemy.new()

func test_hurt_big_enemy_valid_100():
	dano = 100
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, 50, "Resultado deveria ser 50")
	
	
func test_hurt_big_enemy_valid_4():
	dano = 4
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, 98, "Resultado deveria ser 98")

func test_hurt_big_enemy_valid_400():
	dano = 400
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, "dead", "Resultado deveria ser 'dead'")
	
func test_hurt_big_enemy_valid_1():
	dano = 1
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, 99, "Resultado deveria ser 99")

func test_hurt_big_enemy_invalid_neg40():
	dano = -1
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, "valor de dano invalido", "Resultado deveria ser 'valor de dano invalido'")
	
func test_hurt_big_enemy_invalid_string():
	dano = "pamonhafrita"
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, "valor de dano invalido", "Resultado deveria ser 'valor de dano invalido'")
	
	
func test_hurt_big_enemy_valid_0():
	dano = 0
	resultado = bigEnemy.hurt(dano,false)
	assert_eq(resultado, 100, "Resultado deveria ser 100")
	
# teste com inimigo pequeno

func test_hurt_little_enemy_valid_100():
	dano = 100
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, 10, "Resultado deveria ser 10")
	
	
func test_hurt_little_enemy_valid_4():
	dano = 4
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, 96, "Resultado deveria ser 96")

func test_hurt_little_enemy_valid_400():
	dano = 400
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, "dead", "Resultado deveria ser 'dead'")

func test_hurt_little_enemy_valid_1():
	dano = 1
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, 99, "Resultado deveria ser 99")

func test_hurt_little_enemy_invalid_neg40():
	dano = -1
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, "valor de dano invalido", "Resultado deveria ser 'valor de dano invalido'")

func test_hurt_little_enemy_invalid_string():
	dano = "pamonhafrita"
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, "valor de dano invalido", "Resultado deveria ser 'valor de dano invalido'")


func test_hurt_little_enemy_valid_0():
	dano = 0
	resultado = littleEnemy.hurt(dano,false)
	assert_eq(resultado, 100, "Resultado deveria ser 100")

	
