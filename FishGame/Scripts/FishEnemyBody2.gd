extends KinematicBody2D

var player = null

var velocity = Vector2.ZERO
var maxSpeed = 5.0
var vacantSpeed = 2

func _physics_process(delta):
#	if player != null:
#		velocity = position.direction_to(player.position) * maxSpeed
#	else:
#		velocity = Vector2.ZERO
#
#	#velocity = velocity.normalized()
#	#velocity = move_and_collide(velocity)
	pass


func _on_Area2D_body_entered(body):
	if body != self:
		player = body

func _on_Area2D_body_exited(body):
	body = null
