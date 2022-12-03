extends KinematicBody2D

var player = null

var velocity = Vector2.ZERO
var maxSpeed = 110
var vacantSpeed = 80
var hp: int = 100
var followDot = null
onready var health_bar = $Healthbar
<<<<<<< HEAD
var caminho
var armor = 0.5
=======
var minimap_icon = "enemy"
>>>>>>> 23-implementar-o-um-minimapa-do-player

signal removed
		
func _ready():
<<<<<<< HEAD
	caminho = get_parent().get_child(1)
	followDot = caminho.get_child(0).get_child(0)
	pass
=======
	var cena = get_parent().get_parent().get_parent()
	cena.get_parent().get_parent().get_parent().find_node("MiniMap")._new_marker(get_parent())	
	for child in cena.get_children():
		if child.name == "Path2D":
			followDot = child.get_child(0).get_child(0)
>>>>>>> 23-implementar-o-um-minimapa-do-player

func _physics_process(delta):
	self.look_at(velocity+self.global_position)
	if player != null:
		velocity = (player.global_position - global_position).normalized() * maxSpeed
		look_at(player.global_position)	
	elif followDot != null:
		look_at(followDot.global_position)
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
		dead()
		
func dead():
	emit_signal("removed", get_parent())
	get_parent().queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "PlayerBody":
		player = body
		pass

func _on_Area2D_body_exited(body):
	if body.name == "PlayerBody":
		player = null
