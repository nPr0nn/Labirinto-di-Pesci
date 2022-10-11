extends Camera2D
onready var Game = get_node("/root/Singleton")

export (NodePath) onready var player = get_node(player)
export (NodePath) onready var viewport_container = get_node(viewport_container)
onready var real_camera_position     = global_position

func _process(delta):
	print("oi")
	var mouse_position  = get_viewport().get_mouse_position() / Game.window_scale - (Game.size - Vector2(10, 10))/2 + player.global_position
	
	var calculated_camera_position = lerp(player.global_position, mouse_position, 0.7)
	real_camera_position = lerp(real_camera_position, calculated_camera_position, delta*5)
	var subpixel_camera_position = real_camera_position.round() - real_camera_position
	
	viewport_container.material.set_shader_param("camera_offset", subpixel_camera_position)
	global_position = real_camera_position.round()
	
	pass 
