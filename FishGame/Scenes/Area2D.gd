extends Area2D

var foodValue = 50

func _ready():
	pass
	
func _on_Area2D_body_entered(body):
	var cena = get_parent().get_parent().get_parent()
	var player = cena.find_node('Player')
	player.get_child(0).heal(foodValue)
	get_parent().queue_free()
