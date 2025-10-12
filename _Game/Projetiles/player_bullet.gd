extends Area2D

##Velocidade do tiro
@export var speed:float = 600.0

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enimies"):
		area.take_damage(1)
		queue_free()
