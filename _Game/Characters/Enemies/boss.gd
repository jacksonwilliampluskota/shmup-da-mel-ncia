extends Area2D
class_name Boss

@export var muzzle:Marker2D
signal spawn_laser_boss(location)

@export var hp:int = 100

var boss_state:GlobalConfigWord.boss_state


func take_damage(damage:int):
	hp -= damage
	
	if hp <= 0:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if  area is Player:
			if area.timer_invincibility.is_stopped():
				area.take_damage(1) 


func _on_timer_timeout() -> void:
	#exemplo random enum
	#State.keys()[randi() % State.size()]
	emit_signal("spawn_laser_boss", muzzle.global_position)
