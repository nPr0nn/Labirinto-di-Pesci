extends KinematicBody2D

var player = null

var velocity = Vector2.ZERO
var maxSpeed = 200
var vacantSpeed = 80
var hp: int = 100
onready var health_bar = $Healthbar

func _ready():
	pass

func _physics_process(delta):
	if player != null:
		velocity = (player.global_position - global_position).normalized() * maxSpeed
	else:
		velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)
	
	#colisions
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "PlayerBody":
			collision.collider.hurt()
			
func hurt(dano = 1):
	hp-=dano
	health_bar._on_health_updated(hp,0)
	if hp<=0:
		queue_free()

func _on_Vision_body_entered(body):
	if body.name == "PlayerBody":
		#player = body
		pass


func _on_Vision_body_exited(body):
	if body.name == "PlayerBody":
		player = null
