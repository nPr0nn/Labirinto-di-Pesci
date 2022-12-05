extends "res://addons/gut/test.gd"

var _objectFactory = load("res://Scripts/ObjectFactory.gd")
var objectFactory
var simbolo
var resultado

func before_each():
	objectFactory = _objectFactory.new()

func test_principal_wall():
	simbolo = "#"
	resultado = objectFactory.build_map(0,0,false,simbolo)
	assert_eq(resultado, 528, "Resultado deveria ser 528")
	
func test_principal_space():
	simbolo = "."
	resultado = objectFactory.build_map(0,0,false,simbolo)
	assert_eq(resultado, 1362, "Resultado deveria ser 1362")
	
func test_principal_food():
	simbolo = "F"
	resultado = objectFactory.build_map(0,0,false,simbolo)
	assert_eq(resultado, 18, "Resultado deveria ser 18")
	
func test_principal_big():
	simbolo = "B"
	resultado = objectFactory.build_map(0,0,false,simbolo)
	assert_eq(resultado, 4, "Resultado deveria ser 4")
	
func test_principal_little():
	simbolo = "L"
	resultado = objectFactory.build_map(0,0,false,simbolo)
	assert_eq(resultado, 8, "Resultado deveria ser 8")
	
func test_principal_invalid():
	simbolo = "*"
	resultado = objectFactory.build_map(0,0,false,simbolo)
	assert_eq(resultado, 0, "Resultado deveria ser 0")
	
func test_secundary_wall():
	simbolo = "#"
	resultado = objectFactory.build_map(0,0,false,simbolo,"secundary")
	assert_eq(resultado, 65, "Resultado deveria ser 65")
	
func test_secundary_food():
	simbolo = "F"
	resultado = objectFactory.build_map(0,0,false,simbolo,"secundary")
	assert_eq(resultado, 0, "Resultado deveria ser 0")
	
func test_invalid_map():
	simbolo = "."
	resultado = objectFactory.build_map(0,0,false,simbolo,"pamonha_land")
	assert_eq(resultado, "aquivo do mapa nao existe", "Resultado deveria ser 'aquivo do mapa nao existe'")
	
