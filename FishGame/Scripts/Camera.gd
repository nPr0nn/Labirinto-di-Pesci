extends Camera2D
onready var Game = get_node("/root/Singleton")

export (NodePath) onready var player = get_node(player)
export (NodePath) onready var viewport_container = get_node(viewport_container)
onready var real_camera_position     = global_position

func _process(delta):
	var mouse_position_on_screen = (get_viewport().get_mouse_position()/Game.window_scale)
	mouse_position_on_screen.x = clamp(mouse_position_on_screen.x, 64, 192)
	mouse_position_on_screen.y = clamp(mouse_position_on_screen.y, 36, 108)
	var mouse_position  = mouse_position_on_screen - Game.size/2 + player.global_position
	
	#print(player.position)
	
	var calculated_camera_position = lerp(player.global_position, mouse_position, 0.7)
	real_camera_position = lerp(real_camera_position, calculated_camera_position, delta*5)
	var subpixel_camera_position = real_camera_position.round() - real_camera_position
	
	viewport_container.material.set_shader_param("camera_offset", subpixel_camera_position)
	global_position = real_camera_position.round()
	
	pass 
