extends MarginContainer
onready var Game = get_node("/root/Singleton")

export (NodePath) var player
export var zoom = 6

onready var grid = $MarginContainer/Grid
onready var player_marker = $MarginContainer/Grid/PlayerMarker
onready var enemy_marker = $MarginContainer/Grid/EnemyMarker
onready var hero_marker = $MarginContainer/Grid/HeroMarker
onready var npc_marker = $MarginContainer/Grid/NpcMarker

var grid_scale
var icons = {}
var markers = {}
	
func _ready():
	icons['enemy'] = enemy_marker
	icons['box'] = hero_marker
	icons['npc']   = npc_marker
	
	player_marker.position = grid.rect_size / 2
	grid_scale = grid.rect_size / ((get_viewport_rect().size/Game.window_scale) * zoom)
	var map_objects = get_tree().get_nodes_in_group("minimap_objects")

	for item in map_objects:
		var new_marker = icons[item.get_child(0).minimap_icon].duplicate()
		grid.add_child(new_marker)
		new_marker.show()
		markers[item] = new_marker
		item.get_child(0).connect("removed", self, "_on_object_removed")

func _process(delta):
	if !player:
		return
	player_marker.rotation = get_node(player).rotation + PI / 2
			
	for item in markers:
		markers[item].show()
		var radius = grid.rect_size.x/2		
		var obj_pos = (item.get_child(0).global_position - get_node(player).global_position)*grid_scale + grid.rect_size/2

		var pos = obj_pos - Vector2(radius, radius)
		var lim =  sqrt(pos.x*pos.x + pos.y*pos.y) 
		pos = pos.normalized()

		pos.x = ( pos.x * (sqrt(1 - (pos.y*pos.y)/2 )) )
		pos.y = ( pos.y * (sqrt(1 - (pos.x*pos.x)/2 )) )

		pos *= Vector2(radius, radius)
		pos += Vector2(radius, radius)

		if( lim > radius):
			markers[item].hide()

		markers[item].position = obj_pos

func _new_marker(item):
	var new_marker = icons[item.get_child(0).minimap_icon].duplicate()
	grid.add_child(new_marker)
	new_marker.show ()
	markers[item] = new_marker
	item.get_child(0).connect("removed", self, "_on_object_removed")

func _on_object_removed(item):
	markers[item].hide()
	markers.erase(item)

