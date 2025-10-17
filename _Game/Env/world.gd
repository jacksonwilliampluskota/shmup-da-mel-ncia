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
			l.player_ref = $Player
			l.grid_point_ref = $PointGridMoviment
			add_child(l)
		GlobalConfigWord.boss_state.RED_BULLET:
			var l = boss_red_bullet.instantiate()
			l.global_position = location[0]
			l.player_ref = $Player
			l.grid_point_ref = $PointGridMoviment
			add_child(l)
		GlobalConfigWord.boss_state.SUMMONING:
			print("Total:", location.size())
			var l = brutao.instantiate()
			l.global_position = location[0]
			l.player_ref = $Player
			l.grid_point_ref = $PointGridMoviment
			add_child(l)
		GlobalConfigWord.boss_state.SPECIAL:
			var l = explosive.instantiate()
			l.global_position = location[0]
			l.player_ref = $Player
			l.grid_point_ref = $PointGridMoviment
			add_child(l)
		_: # Default case (like 'default' in switch-case)
			print("Unknown player state.")
		
		
	
	
