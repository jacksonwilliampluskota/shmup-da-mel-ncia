extends Area2D

##Velocidade do tiro
@export var speed:float = 600.0

##Vida do bullet sniper fly
@export var hp:int = 1

enum direction_spawnable_bullet {  
 UP,
LEFT_UP,
LEFT_DOWN,
DOWN,
RIGHT_DOWN,
RIGHT_UP     
}

func _physics_process(delta: float) -> void:
	global_position.x += -speed * delta

func take_damage(damage:int):
	hp -= damage
	
	if hp <= 0:
		queue_free()
