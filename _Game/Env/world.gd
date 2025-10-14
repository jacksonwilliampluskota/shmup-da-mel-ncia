extends Node2D
class_name  GridPoint

@export var laserPlayer:PackedScene

@export var laserBoss:PackedScene
@export var sniper_fly:PackedScene
@export var brutao:PackedScene

@export var Gridpoint:Node2D


var grid_tile_size:float = 100

func _ready() -> void:
	GlobalConfigWord.main_world = self
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_player_spawn_laser(location: Variant) -> void:
	var l = laserPlayer.instantiate()
	l.global_position = location
	add_child(l)


func _on_boss_spawn_laser_boss(location: Variant) -> void:
	var l = brutao.instantiate()
	l.global_position = location
	l.player_ref = $Player
	l.grid_point_ref = $PointGridMoviment
	
	add_child(l)
