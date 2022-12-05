extends 'res://addons/gut/test.gd'

var Factory = load("res://Scripts/ObjectFactory.gd")
var factory = null

func before_each():
	factory = Factory.new()
	pass
	
func after_each():
	factory.free()
	pass

# Testa o método de set e get da escala de spawn
# Usando classes de equivalencia e valor limite
func test_setget_scale_1():
	var setado  = factory.set_scale(64)
	var escala  = factory.get_scale()
	assert_eq(setado, true, 'Valor válido foi lido na escala')
	assert_eq(escala, 64, 'Escala deve receber inteiro positivo')
	pass 

func test_setget_scale_2():
	var setado  = factory.set_scale(-1)
	var escala  = factory.get_scale()
	assert_eq(setado, false, 'Valor inválido não foi lido na escala')
	assert_eq(escala, null, 'Escala não deve receber inteiro não positivo')
	pass
	
func test_setget_scale_3():
	var setado  = factory.set_scale(0)
	var escala  = factory.get_scale()
	assert_eq(setado, false, 'Valor inválido não foi lido na escala')
	assert_eq(escala, null, 'Escala não deve receber inteiro não positivo')
	pass

func test_setget_scale_4():
	var setado  = factory.set_scale(1)
	var escala  = factory.get_scale()
	assert_eq(setado, true, 'Valor válido foi lido na escala')
	assert_eq(escala, 1, 'Escala deve receber inteiro positivo')
	pass 
			
func test_setget_scale_5():
	var setado  = factory.set_scale("pao de batata")
	var escala  = factory.get_scale()
	assert_eq(setado, false, 'Valor inválido não foi lido na escala')
	assert_eq(escala, null,  'Escala não deve receber string')
	pass

func test_setget_scale_6():
	var setado  = factory.set_scale(true)
	var escala  = factory.get_scale()
	assert_eq(setado, false, 'Valor inválido não foi lido na escala')
	assert_eq(escala, null, 'Escala não deve receber booleana')
	pass

func test_setget_scale_7():
	var setado  = factory.set_scale(2048)
	var escala  = factory.get_scale()
	assert_eq(setado, true, 'Valor válido foi lido na escala')
	assert_eq(escala, 2048, 'Escala deve receber inteiro positivo')
	pass 
	
func test_setget_scale_8():
	var setado  = factory.set_scale(100000000)
	var escala  = factory.get_scale()
	assert_eq(setado, true, 'Valor válido foi alterado para o limite superior e lido na escala')
	assert_eq(escala, 2048, 'Escala deve receber inteiro positivo')
	pass 

# Testa se o tamanho do mapa spawnado é correto
func test_map_dimensions_1():
	var mapa = ['#...........#', '#...........#', '#...........#']
	var dim = factory.get_dim(mapa)
	assert_eq(dim.x, 13, 'Comprimento do mapa correto')
	assert_eq(dim.y, 3, 'Comprimento do mapa correto')
	pass
	
func test_map_dimensions_2():
	var mapa = []
	var dim = factory.get_dim(mapa)
	assert_eq(dim.x, 0, 'Comprimento do mapa correto')
	assert_eq(dim.y, 0, 'Comprimento do mapa correto')
	pass
		
func test_map_dimensions_3():
	var mapa = []
	for i in range(100000):
		var linha = []
		for j in range(300):
			linha.append('#')
		mapa.append(linha)
	var dim = factory.get_dim(mapa)
	assert_eq(dim.x, 300, 'Comprimento do mapa correto')
	assert_eq(dim.y, 100000, 'Comprimento do mapa correto')
	pass
	
# Testa se o spawn de objetos foi feito em uma posição permitida
func test_spawn_1():
	var setado  = factory.set_scale(64)
	var escala  = factory.get_scale()
	var mapa    = factory.load_map("res://Data/mapa.txt")
	var dim     = factory.get_dim(mapa)
	
	var object = factory.addObject("BigEnemy", 200, 200, dim*escala)
	assert_true(object != null, 'Objeto foi criado')
	assert_eq(object.global_position.x, 200, 'Posição x do objeto no mapa correta')
	assert_eq(object.global_position.y, 200, 'Posição y do objeto no mapa correta')
	
func test_spawn_2():
	var setado  = factory.set_scale(64)
	var escala  = factory.get_scale()
	var mapa    = factory.load_map("res://Data/mapa.txt")
	var dim     = factory.get_dim(mapa)
	
	var object = factory.addObject("BigEnemy", 0, 0, dim*escala)
	assert_true(object != null, 'Objeto foi criado')
	assert_eq(object.global_position.x, 0, 'Posição x do objeto no mapa correta')
	assert_eq(object.global_position.y, 0, 'Posição y do objeto no mapa correta')
	
func test_spawn_3():
	var setado  = factory.set_scale(64)
	var escala  = factory.get_scale()
	var mapa    = factory.load_map("res://Data/mapa.txt")
	var dim     = factory.get_dim(mapa)
	
	var object = factory.addObject("BigEnemy", -1, -1, dim*escala)
	assert_true(object == null, 'Objeto não foi criado pois a posição é invalida')
	
func test_spawn_4():
	var setado  = factory.set_scale(2)
	var escala  = factory.get_scale()
	var mapa    = factory.load_map("res://Data/mapa.txt")
	var dim     = factory.get_dim(mapa)
	
	var object = factory.addObject("BigEnemy", 1000, 2000, dim*escala)
	assert_true(object == null, 'Objeto não foi criado pois a posição é invalida')
	
func test_spawn_5():
	var setado  = factory.set_scale(2)
	var escala  = factory.get_scale()
	var mapa    = factory.load_map("res://Data/mapa.txt")
	var dim     = factory.get_dim(mapa)
	
	var object = factory.addObject("BigEnemy", escala*(dim.x), escala*(dim.y), dim*escala)
	assert_true(object == null, 'Objeto foi criado pois a posição é valida')
	
	
