extends Control

onready var health_bar_under = $BarraVidaUnder
onready var health_bar_over = $BarraVidaOver
onready var update_tween = $UpdateTween

func _on_health_updated(health, amount):
	health_bar_over.value = health
	update_tween.interpolate_property(health_bar_under,"value",health_bar_under.value,health,0.4,Tween.TRANS_SINE,Tween.EASE_IN_OUT,0.4)
	update_tween.start()

	_assign_color(health)
	
func _assign_color(health):
	var porcent = health/health_bar_under.max_value
	if porcent>0.5:
		health_bar_over.tint_progress = Color((1-porcent)*2,1,0)
	else:
		health_bar_over.tint_progress = Color(1,(porcent)*2,0)

func _on_max_health_updated(max_health):
	health_bar_under.max_value = max_health
	health_bar_over.max_value = max_health
