# PlayerSript: script que controla o personagem do jogador

extends KinematicBody2D

# Guarda informações gerais sobre o jogo (Tamanho da janela, escala, etc..)
onready var Game              = get_node("/root/Singleton") 
onready var state             = SwimmingState.new(self)

# Estados em que o personagem do player pode se encontrar
enum STATE {SWIMMING, FALLING}

func get_type():
	return "player"

# Variaveis importantes para o personagem
# Lista de variaveis internas do player
var total_time: float  = 0
var speed: float       = 0
var velocity: Vector2  = Vector2(0,0)
var acceleration: float = 0.2
var timer_dash: int = 0

# Funções gerais que são chamadas em todos os estados
func _ready():
	set_process_input(true)
	set_process(true)
	pass
	
func _process(delta):
	state._process(delta)
	timer_dash-=1
	pass
	
func _physics_process(delta):
	total_time += delta
	rotate_child_sprite(1, total_time, 0.03, 0.5*PI, 0)
	rotate_child_sprite(2, total_time, 0.01, PI, 0)
	rotate_child_sprite(3, total_time, 0.015, PI, 0)
	rotate_child_sprite(4, total_time, 0.015, PI, 0)
	rotate_child_sprite(5, total_time, 0.015, 0.66*PI, 0)
	rotate_child_sprite(6, total_time, 0.015, 0.5*PI, 0)
		
	state._input()
	state._physics_process(delta)
	move_and_collide(velocity)
	pass

# Troca o estado do peixe
func set_state(new_state):
	state.exit()
	if(new_state == STATE.SWIMMING):
		state = SwimmingState.new(self)
	elif(new_state == STATE.FALLING):
		state = FallingState.new(self)
	pass
	
# Estado em que o peixe está nadando dentro de uma região de água
class SwimmingState:
	var fish
	var gravity_on_water: Vector2  = Vector2(0, 0.001)
	var max_speed_on_water: float  = 4.5
	var max_speed_dash_on_water: float = 10
	var friction_on_water: float   = 0.97
	
	func _init(fish):
		self.fish = fish

	func _process(delta):
		if(fish.Game.gameplay_type == fish.Game.GAMEPLAY_TYPE.MOUSE):
			var mouse_position_on_viewport = fish.get_viewport().get_mouse_position()/fish.Game.window_scale - fish.Game.size/2
			fish.look_at(mouse_position_on_viewport + fish.global_position)
		elif(fish.Game.gameplay_type == fish.Game.GAMEPLAY_TYPE.KEYBOARD):
			fish.look_at(fish.velocity + fish.global_position)
		pass
	
	func _physics_process(delta):		
		fish.velocity += gravity_on_water
		if fish.timer_dash > 0:
			fish.speed = min(fish.velocity.length(), max_speed_dash_on_water)
		else:
			fish.speed = min(fish.velocity.length(), max_speed_on_water)
		fish.velocity = fish.velocity.normalized()*fish.speed*friction_on_water
		pass
	
	func _input():
		if(fish.Game.gameplay_type == fish.Game.GAMEPLAY_TYPE.MOUSE):
			fish.move_with_mouse()
		elif(fish.Game.gameplay_type == fish.Game.GAMEPLAY_TYPE.KEYBOARD):
			fish.move_with_keyboard()
		pass
		
	func exit():
		pass
	
class FallingState:
	var fish
	var gravity_in_air: Vector2  = Vector2(0, 0.18)
	var friction_on_air: float   = 0.96
	var max_speed_on_air: float  = 10
	
	func _init(fish):
		self.fish = fish
		
	func _process(delta):
		if(fish.Game.gameplay_type == fish.Game.GAMEPLAY_TYPE.MOUSE):
			var mouse_position_on_viewport = fish.get_viewport().get_mouse_position()/fish.Game.window_scale - fish.Game.size/2
			fish.look_at(mouse_position_on_viewport + fish.global_position)
		elif(fish.Game.gameplay_type == fish.Game.GAMEPLAY_TYPE.KEYBOARD):
			fish.look_at(fish.velocity + fish.global_position)
		pass
		
	func _physics_process(delta):
		fish.velocity += gravity_in_air
		fish.speed = fish.velocity.length()
		fish.speed = min(fish.velocity.length(), max_speed_on_air)
		print(fish.velocity.length())
		fish.velocity = fish.velocity.normalized()*fish.speed*friction_on_air
		pass
	
	func _input():
		pass
		
	func exit():
		pass

# Funções utilidades que podem ser usadas em qualquer estado
func rotate_child_sprite(sprite_index, time, amplitude, period, phase_shift):
	get_child(sprite_index).rotate(amplitude*sin(time * (2*PI/period) + phase_shift))	
	pass
	
# Funções relacionadas ao movimento do player
func move_with_mouse():
	if(Input.is_mouse_button_pressed(1)):
		var mouse_position_on_viewport = get_viewport().get_mouse_position()/Game.window_scale - Game.size/2
		var mouse_position = mouse_position_on_viewport + global_position 
		speed += acceleration
		velocity = (global_position.direction_to(mouse_position).normalized() * speed)
	if(Input.is_mouse_button_pressed(2) and timer_dash < -30):
		var mouse_position_on_viewport = get_viewport().get_mouse_position()/Game.window_scale - Game.size/2
		var mouse_position = mouse_position_on_viewport + global_position 
		speed += acceleration
		timer_dash = 4
		velocity = (global_position.direction_to(mouse_position).normalized() * speed * 1000)

func move_with_keyboard():
	if(Input.is_action_pressed("ui_up")):
		velocity.y -= acceleration
	if(Input.is_action_pressed("ui_down")):
		velocity.y += acceleration
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= acceleration
	if(Input.is_action_pressed("ui_right")):
		velocity.x += acceleration
	pass
	
# Funções relacionadas a entrar e sair da agua
func _on_Water_body_entered(body):
	if(body.get_type() == "player"):
		set_state(STATE.SWIMMING)
	
func _on_Water_body_exited(body):
	if(body.get_type() == "player"):
		velocity *= 2.7
		set_state(STATE.FALLING)
