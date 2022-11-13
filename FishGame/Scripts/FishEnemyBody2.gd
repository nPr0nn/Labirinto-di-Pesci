extends KinematicBody2D

var player = null

var velocity = Vector2.ZERO
var maxSpeed = 200
var vacantSpeed = 2

func _physics_process(delta):
	if player != null:
		velocity = (player.global_position - global_position).normalized() * maxSpeed
	else:
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body != self:
		player = body

func _on_Area2D_body_exited(body):
	player = null
