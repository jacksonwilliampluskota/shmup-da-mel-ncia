extends Area2D


##Velocidade do tiro
@export var speed:float = 600.0

func _physics_process(delta: float) -> void:
	
	global_position.x += speed * delta
