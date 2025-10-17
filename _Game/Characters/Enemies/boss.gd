extends Area2D
class_name Boss

@export var muzzle:Marker2D
signal spawn_laser_boss(location:Array[Vector2], state)

@export var hp:int = 100

@export var position_basic_bullet:Array[Marker2D]
@export var position_special_bullet:Marker2D
@export var mini_enimies_spawns:Node2D

var boss_state:GlobalConfigWord.boss_state
var rng = RandomNumberGenerator.new()



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
	var global_state = GlobalConfigWord.boss_state.keys()[randi() % GlobalConfigWord.boss_state.size()]
	
	var all_position_shoot:Array
	var position_shoot
	
	match global_state:
		GlobalConfigWord.boss_state.BLUE_BULLET:
			position_shoot = position_basic_bullet[rng.randf_range(0, 1)].global_position
			all_position_shoot.append(position_shoot)
		GlobalConfigWord.boss_state.RED_BULLET:
			position_shoot = position_basic_bullet[rng.randf_range(0, 1)].global_position
			all_position_shoot.append(position_shoot)
		GlobalConfigWord.boss_state.SUMMONING:
			for i in 7:
				all_position_shoot.append(mini_enimies_spawns.get_children()[randi() % mini_enimies_spawns.get_child_count()].global_position)
		GlobalConfigWord.boss_state.SPECIAL:
			all_position_shoot.append(position_special_bullet.position)
		_: # Default case (like 'default' in switch-case)
			print("Unknown player state.")
	
	emit_signal("spawn_laser_boss", all_position_shoot, global_state)
