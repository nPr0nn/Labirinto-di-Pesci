extends KinematicBody2D
onready var Game = get_node("/root/Singleton")

var velocity = Vector2(0,0)

var speed = 0
var maxSpeed = 7
var aceleration = 0.2
var friction = 0.97
var gravity = Vector2(0, -0.05)

var target = Vector2(0, 0)	
var mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_viewport().get_mouse_position() / Game.window_scale - (Game.size - Vector2(10, 10))/2 + global_position

	if mouse_position.x < position.x:
		$Sprite.flip_h()
		
	look_at(mouse_position)
	pass
	
func _physics_process(delta):
	var move_direction = Vector2(0,0)
	
	if Input.is_mouse_button_pressed(1): 
		target = mouse_position
		speed += aceleration
		velocity = ( global_position.direction_to(target).normalized() )* speed
	
	speed *= friction
	if speed > maxSpeed:
		speed = maxSpeed
	
	print(speed)
	
	velocity = velocity.normalized()*speed - gravity
	
	move_and_collide(velocity)

	
