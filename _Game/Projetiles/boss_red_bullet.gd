extends Area2D

##Velocidade do tiro
@export var speed:float = 600.0

##Vida do bullet sniper fly
@export var hp:int = 1

##Vida do bullet sniper fly
@export var damage_bullet:int = 1

func _physics_process(delta: float) -> void:
	global_position.x += -speed * delta
	
	

func take_damage(damage:int):
	hp -= damage
	if hp <= 0:
		queue_free()
		
		
	
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if  area is Player:
			if area.timer_invincibility.is_stopped():
				area.take_damage(damage_bullet) 
				
				
			
			
		
		
	
	
