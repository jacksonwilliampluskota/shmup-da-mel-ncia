extends Area2D
class_name Boss

@export var muzzle:Marker2D
signal spawn_laser_boss(location)

var hp:int = 100


func take_damage(damage:int):
	hp -= damage
	
	if hp <= 0:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		area.take_damage(1)


func _on_timer_timeout() -> void:
	emit_signal("spawn_laser_boss", muzzle.global_position)
