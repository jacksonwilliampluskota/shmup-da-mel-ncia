extends Node2D

@export var laserPlayer:PackedScene

@export var laserBoss:PackedScene

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_player_spawn_laser(location: Variant) -> void:
	var l = laserPlayer.instantiate()
	l.global_position = location
	add_child(l)


func _on_boss_spawn_laser_boss(location: Variant) -> void:
	var l = laserBoss.instantiate()
	l.global_position = location
	add_child(l)
