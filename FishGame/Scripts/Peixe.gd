extends KinematicBody2D
onready var Game = get_node("/root/Singleton")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 3.5
var mouse_position

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_viewport().get_mouse_position() / Game.window_scale - (Game.size - Vector2(10, 10))/2 + global_position
	look_at(mouse_position)
	pass
	
func _physics_process(delta):
	var move_direction = Vector2(0,0)
	
	var target
	if Input.is_mouse_button_pressed(1): 
		target = mouse_position
		var velocity = global_position.direction_to(target) * 200
		velocity = move_and_slide(velocity)
	
#	var key_up = Input.is_action_pressed("ui_up")
#	var key_down = Input.is_action_pressed("ui_down")
#	var key_left = Input.is_action_pressed("ui_left")
#	var key_right = Input.is_action_pressed("ui_right")
#
#	if key_up:
#		move_direction.y = -speed
#	if key_down:
#		move_direction.y = speed
#	if key_right:
#		move_direction.x = speed
#	if key_left:
#		move_direction.x = -speed
	
#	look_at(global_position + move_direction)
#	move_and_collide(move_direction)
	
