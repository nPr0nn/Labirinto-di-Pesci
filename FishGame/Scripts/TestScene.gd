extends Node2D

var index_object_factory
var filhos
onready var object_factory = $objectFactory

func _ready():
	#object_factory.addObjectCol("box", 21, -187, 990, 64)
	#object_factory.addObjectCol("box", 21,  901, 990, 64)
	#object_factory.addObjectRow("box", 17, -187, 286, 64)
	object_factory.build_map(-187,-1186)
	
		
