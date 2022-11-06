extends Area2D

func _ready():
	pass # Replace with function body.


func _on_Water_area_entered(area):
	get_parent().alterarGravidade(true, Vector2(0, 0.005))

func _on_Water_area_exited(body):
	get_parent().alterarGravidade(false, Vector2(0, 0.05))
