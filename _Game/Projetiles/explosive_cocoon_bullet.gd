extends Area2D

##Velocidade do tiro
@export var speed:float = 600.0

##Vida do bullet sniper fly
@export var hp:int = 1


@export var direction:GlobalConfigWord.direction_spawnable_bullet

func _physics_process(delta: float) -> void:
	
	if direction == GlobalConfigWord.direction_spawnable_bullet.LEFT_UP:
		global_position.x += -speed * delta
		global_position.y += -speed * delta
	
	if direction == GlobalConfigWord.direction_spawnable_bullet.LEFT_DOWN:
		global_position.x += -speed * delta
		global_position.y += speed * delta
	
	if direction == GlobalConfigWord.direction_spawnable_bullet.RIGHT_DOWN:
		global_position.x += speed * delta
		global_position.y += speed * delta
	
	if direction == GlobalConfigWord.direction_spawnable_bullet.RIGHT_UP:
		global_position.x += speed * delta
		global_position.y += -speed * delta
	
	if direction == GlobalConfigWord.direction_spawnable_bullet.UP:
		global_position.y += -speed * delta
	
	if direction == GlobalConfigWord.direction_spawnable_bullet.DOWN:
		global_position.y += speed * delta
	

func take_damage(damage:int):
	hp -= damage
	if hp <= 0:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if  area is Player:
			if area.timer_invincibility.is_stopped():
				area.take_damage(1) 
