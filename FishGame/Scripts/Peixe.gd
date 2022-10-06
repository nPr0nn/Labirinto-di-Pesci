extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
var maxSpeed = 3
var aceleration = 0.05
var atrito = 1-0.03
var click

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	#look_at((position))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	draw_line(position, velocity, 1)
	look_at(global_position+velocity)
	#look_at((position))
	
func _physics_process(delta):
	click = false
	
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
	
