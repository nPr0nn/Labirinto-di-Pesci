extends KinematicBody2D	# configurar para funcionar com tiles

export var velocity = Vector2(0,0)
export var aceleration = 0.2
export var atrito = 1-0.03
export var speed = 0
export var maxSpeed = 4.5
export var gravity = Vector2(0, 0.005)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
