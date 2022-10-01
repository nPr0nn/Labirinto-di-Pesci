extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 3.5


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)
	
func _physics_process(delta):
	var move_direction = Vector2(0,0)
	
	var key_up = Input.is_action_pressed("ui_up")
	var key_down = Input.is_action_pressed("ui_down")
	var key_left = Input.is_action_pressed("ui_left")
	var key_right = Input.is_action_pressed("ui_right")
	print("oi")
	if key_up:
		move_direction.y = -speed
	if key_down:
		move_direction.y = speed
	if key_right:
		move_direction.x = -speed
	if key_left:
		move_direction.x = speed
		
	move_and_collide(move_direction)
	
