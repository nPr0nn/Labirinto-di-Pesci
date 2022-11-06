extends KinematicBody2D
onready var Game = get_node("/root/Singleton")

var velocity = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var aceleration = 0.2
var atrito = 1-0.03
var click
var speed = 0
var maxSpeed = 3
var gravity = Vector2(0, 0.005)
var useMouse = true
var onWater = true

var target = Vector2(0, 0)
var mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	#look_at((position))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if useMouse:
		mouse_position = get_viewport().get_mouse_position() / Game.window_scale - (Game.size - Vector2(10, 10))/2 + global_position
		look_at(mouse_position)
	else:
		look_at(global_position+velocity)
	

func _physics_process(delta):
	
	if Input.is_mouse_button_pressed(1) and onWater:		
		useMouse = true
		target = mouse_position
		speed += aceleration
		#velocidade eh o produto da dir pelo modulo, apenas atualiza ao clicar
		velocity = ( global_position.direction_to(target).normalized() )* speed
	
	speed *= atrito
	if speed > maxSpeed:
		speed = maxSpeed
	
	click = false
	
#codigo geral
	var key_up = Input.is_action_pressed("ui_up")
	var key_down = Input.is_action_pressed("ui_down")
	var key_left = Input.is_action_pressed("ui_left")
	var key_right = Input.is_action_pressed("ui_right")
	if key_up and velocity.y > -maxSpeed:
		click = true
		if onWater:
			velocity.y -= aceleration
	if key_down and velocity.y < maxSpeed:
		click = true
		if onWater:
			velocity.y += aceleration
	if key_right and velocity.x < maxSpeed:
		click = true
		if onWater:
			velocity.x += aceleration
	if key_left and velocity.x > -maxSpeed:
		click = true
		if onWater:
			velocity.x -= aceleration
	if not click:
		velocity.x *= atrito
		velocity.y *= atrito
	else:
		useMouse = false
	
	velocity += gravity
	move_and_collide(velocity)
	
#func _on_area_mar_body_entered(body):
#	gravity = Vector2(0, 0.005)
#	onWater=true

func alterarGravidade(agua, gravidade):
	gravity = gravidade
	onWater = agua

func _on_Water_body_entered(body):
	alterarGravidade(true, Vector2(0, 0.005))

func _on_Water_body_exited(body):
	alterarGravidade(false, Vector2(0, 0.05))
