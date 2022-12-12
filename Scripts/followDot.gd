extends Node2D

onready var pathfollow = get_parent()

func _ready():
	pass

func loopMovement(delta): 
	pathfollow.offset += 30 * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	loopMovement(delta)
