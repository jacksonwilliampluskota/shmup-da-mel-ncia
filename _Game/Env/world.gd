extends Node2D
class_name  GridPoint

@export var laserPlayer:PackedScene
@export var special_laser_Player:PackedScene

@export var laserBoss:PackedScene
@export var sniper_fly:PackedScene
@export var brutao:PackedScene
@export var explosive:PackedScene
@export var boss_blue_bullet:PackedScene
@export var boss_red_bullet:PackedScene

@export var Gridpoint:Node2D


var grid_tile_size:float = 100

func _ready() -> void:
	GlobalConfigWord.main_world = self
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_player_spawn_laser(location: Variant) -> void:
	var l = laserPlayer.instantiate()
	l.player_ref = $Player
	l.global_position = location
	add_child(l)
	
	

func _on_player_special_spawn_laser(location: Variant) -> void:
	var l = special_laser_Player.instantiate()
	l.global_position = location
	add_child(l)
	
	


func _on_boss_spawn_laser_boss(location: Array[Vector2], state: Variant) -> void:
	
	match state:
		GlobalConfigWord.boss_state.BLUE_BULLET:
			var l = boss_blue_bullet.instantiate()
			l.global_position = location[0]
			add_child(l)
		GlobalConfigWord.boss_state.RED_BULLET:
			var l = boss_red_bullet.instantiate()
			l.global_position = location[0]
			add_child(l)
		GlobalConfigWord.boss_state.SUMMONING:
			for i in location.size():
				if i <= 2:
					var pos = 0
					
					if i == 0:
						pos = 1
						
					if i == 1:
						pos = 2
						
					if i == 1:
						pos = 4
					
					var l = brutao.instantiate()
					l.global_position = location[i]
					l.player_ref = $Player
					l.grid_point_ref = $PointGridMoviment
					l.grid_position_line = pos
					add_child(l)
				if i > 2 and i <= 5:
					var pos = 0
					
					if i == 3:
						pos = 0
						
					if i == 4:
						pos = 2
						
					if i == 5:
						pos = 4
						
					
					var l = sniper_fly.instantiate()
					l.global_position = location[i]
					l.player_ref = $Player
					l.grid_point_ref = $PointGridMoviment
					l.grid_position_line = pos
					add_child(l)
				if i > 5:
					var pos = 0
					
					if i == 6:
						pos = 0
						
					if i == 7:
						pos = 4
						
					var l = laserBoss.instantiate()
					l.global_position = location[i]
					l.player_ref = $Player
					l.grid_point_ref = $PointGridMoviment
					l.grid_position_line = pos
					add_child(l)
				
		GlobalConfigWord.boss_state.SPECIAL:
			var l = explosive.instantiate()
			l.global_position = location[0]
			l.player_ref = $Player
			l.grid_point_ref = $PointGridMoviment
			add_child(l)
