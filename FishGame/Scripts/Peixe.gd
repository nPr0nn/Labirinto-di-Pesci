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
var maxSpeed = 7
var gravity = Vector2(0, -0.05)

var target = Vector2(0, 0)	
var mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	#look_at((position))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#inicio codigo geral
	draw_line(position, velocity, 1)
	look_at(global_position+velocity)
	#look_at((position))
# inicio codigo lucas
	mouse_position = get_viewport().get_mouse_position() / Game.window_scale - (Game.size - Vector2(10, 10))/2 + global_position

	if mouse_position.x < position.x:
		$Sprite.flip_h()
		
	look_at(mouse_position)
	
func _physics_process(delta):
	click = false
	
#codigo geral
	var key_up = Input.is_action_pressed("ui_up")
	var key_down = Input.is_action_pressed("ui_down")
	var key_left = Input.is_action_pressed("ui_left")
	var key_right = Input.is_action_pressed("ui_right")
	if key_up and velocity.y > -maxSpeed:
		click = true
		velocity.y -= aceleration
	if key_down and velocity.y < maxSpeed:
		click = true
		velocity.y += aceleration
	if key_right and velocity.x < maxSpeed:
		click = true
		velocity.x += aceleration
	if key_left and velocity.x > -maxSpeed:
		click = true
		velocity.x -= aceleration
	if not click:
		velocity.x *= atrito
		velocity.y *= atrito
	
	move_and_collide(velocity)
#codigo do lucas
	if Input.is_mouse_button_pressed(1): 
		target = mouse_position
		speed += aceleration
		velocity = ( global_position.direction_to(target).normalized() )* speed
	
	speed *= atrito
	if speed > maxSpeed:
		speed = maxSpeed
	
	print(speed)
	
	velocity = velocity.normalized()*speed - gravity
	
	move_and_collide(velocity)


	
