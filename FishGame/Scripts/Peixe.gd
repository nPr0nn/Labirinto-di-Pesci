extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
var maxSpeed = 1
var aceleration = 0.05


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	look_at((position))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	draw_line(position, velocity, 1)
	look_at(velocity)
	
func _physics_process(delta):
	
	var key_up = Input.is_action_pressed("ui_up")
	var key_down = Input.is_action_pressed("ui_down")
	var key_left = Input.is_action_pressed("ui_left")
	var key_right = Input.is_action_pressed("ui_right")
	if key_up and velocity.y > -maxSpeed:
		velocity.y -= aceleration
	if key_down and velocity.y < maxSpeed:
		velocity.y += aceleration
	if key_right and velocity.x < maxSpeed:
		velocity.x += aceleration
	if key_left and velocity.x > -maxSpeed:
		velocity.x -= aceleration
	move_and_collide(velocity)
	
