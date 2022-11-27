extends KinematicBody2D

var player = null
var followDot = null

var velocity = Vector2.ZERO
var maxSpeed = 200
var vacantSpeed = 80
var hp: int = 100
onready var health_bar = $Healthbar

func _ready():
	var cena = get_parent().get_parent()
	for child in cena.get_children():
		if child.get_type() == "Path":
			followDot = child.get_child(0).get_child(0)

func get_type():
	return "simpleEnemy2"

func _physics_process(delta):
	if player != null:
		velocity = (player.global_position - global_position).normalized() * maxSpeed
	elif followDot != null:
		velocity = (followDot.global_position - global_position).normalized() * vacantSpeed
	else:
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "PlayerBody":
			collision.collider.hurt()
func hurt(dano = 1):
	hp-=dano
	health_bar._on_health_updated(hp,0)
	if hp<=0:
		self.get_parent().remove_and_skip()

func _on_Area2D_body_entered(body):
	if body.get_type() == "player":
		player = body
	elif body.get_type() == "followDot":
		followDot = body

func _on_Area2D_body_exited(body):
	player = null
