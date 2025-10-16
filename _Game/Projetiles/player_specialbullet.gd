extends Area2D

##Velocidade do tiro
@export var speed:float = 400.0

##dano do tiro
@export var damage:int = 20

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enimies"):
		area.take_damage(damage)
		queue_free()
