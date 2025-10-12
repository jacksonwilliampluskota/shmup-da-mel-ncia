extends Area2D

@export var speed:float = 200.0

func _physics_process(delta: float) -> void:
	global_position.x += -speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		if area.timer_invincibility.is_stopped():
			area.take_damage(1) 
			queue_free()
