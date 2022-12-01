extends KinematicBody2D

var player = null

var velocity = Vector2.ZERO
var maxSpeed = 200
var vacantSpeed = 80
var hp: int = 100
var followDot = null
onready var health_bar = $Healthbar
var caminho
var armor = 0.5

func _ready():
	caminho = get_parent().get_child(1)
	followDot = caminho.get_child(0).get_child(0)
	pass

func _physics_process(delta):
	self.look_at(velocity+self.global_position)
	if player != null:
		velocity = (player.global_position - global_position).normalized() * maxSpeed
	elif followDot != null:
		velocity = (followDot.global_position - global_position).normalized() * vacantSpeed
	else:
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)
	
	#colisions
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "PlayerBody":
			collision.collider.hurt()
			
func hurt(dano = 1):
	hp-=dano*(1-self.armor)
	health_bar._on_health_updated(hp,0)
	if hp<=0:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "PlayerBody":
		player = body
		pass

func _on_Area2D_body_exited(body):
	if body.name == "PlayerBody":
		player = null
