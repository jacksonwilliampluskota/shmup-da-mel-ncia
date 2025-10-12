extends Area2D
class_name Kamikaze

@export var speed:float = 200.0

@export var my_grid:GlobalConfigWord.grid_spawnable_enimies = GlobalConfigWord.grid_spawnable_enimies.GRID_3

var player_ref:Player
var player_position:Vector2

var grid_point_ref
var grid_max_distanceX:float 

func _ready() -> void:
	if player_ref != null:
		player_position = player_ref.global_position
		
	if grid_point_ref != null:
		grid_max_distanceX = grid_point_ref.get_children()[my_grid].get_children()[0].global_position.x

func _physics_process(delta: float) -> void:
	if global_position.x > grid_max_distanceX:
		if player_ref != null:
			var direction = (player_position - global_position).normalized()
			global_position += direction * speed * delta
	else:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if  area is Player:
			if area.timer_invincibility.is_stopped():
				area.take_damage(1) 
		queue_free()
