extends KinematicBody2D

var player = null

var velocity = Vector2.ZERO
var maxSpeed = 150
var vacantSpeed = 80
var hp: int = 100
var timer: int = 0
onready var health_bar = $Healthbar
var rnd = RandomNumberGenerator.new()
var armor = 0.1
onready var update_tween = $UpdateTween

func _ready():
	 rnd.randomize()

func _physics_process(delta):
	
	self.look_at(velocity+self.global_position)
	
	
	if player != null:
		velocity = (player.global_position - global_position).normalized() * maxSpeed
	else:
		if timer <=0:
			#print("muda velocidade")
			var dir = Vector2(rnd.randf_range(-1,1),rnd.randf_range(-1,1))
			#print(dir)
			#velocity = (dir).normalized() * maxSpeed
			update_tween.interpolate_property(self,"velocity",self.velocity,(dir).normalized() * vacantSpeed,0.4,Tween.TRANS_SINE,Tween.EASE_IN_OUT,0.4)
			update_tween.start()
			#print(self.position)
			timer =200

	velocity = move_and_slide(velocity)
	
	#colisions
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "PlayerBody":
			collision.collider.hurt()
	timer -= 1
			
func hurt(dano = 1):
	hp-=dano*(1-self.armor)
	health_bar._on_health_updated(hp,0)
	if hp<=0:
		queue_free()

func _on_Vision_body_entered(body):
	if body.name == "PlayerBody":
		player = body
		pass


func _on_Vision_body_exited(body):
	if body.name == "PlayerBody":
		player = null
