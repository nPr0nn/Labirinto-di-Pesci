extends 'res://addons/gut/test.gd'

var FishPlayer = load('res://Scripts/PlayerScript.gd')
var _player = null

func before_each():
	_player = FishPlayer.new()
	
func after_each():
	_player.free()

func test_heal_when_full():
	var result = _player.heal(50, false)
	assert_eq(result, 0, "Result should have been 0")
	
func test_heal_when_less_then_half():
	_player.hp = 45
	var result = _player.heal(50, false)
	assert_eq(result, 50, "Result should have been 50")
	
func test_heal_when_more_then_half():
	_player.hp = 55
	var result = _player.heal(50, false)
	assert_eq(result, 45, "Result should have been 45")
	
func test_heal_when_recive_invalid_input():
	var result = _player.heal("farofafrita", false)
	assert_eq(result, "Entrada invalida para a função.", "Result should have been a error string.")
