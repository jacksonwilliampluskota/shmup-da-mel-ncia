extends Area2D


var speed:float = 200


@export var my_grid:GlobalConfigWord.grid_spawnable_enimies = GlobalConfigWord.grid_spawnable_enimies.GRID_3


##Vida do sniper fly
@export var hp:int = 20


var player_ref:Player
var player_position:Vector2

var grid_point_ref

var go_to:Vector2
var rng = RandomNumberGenerator.new()


func _ready() -> void:
	if grid_point_ref != null:
		go_to = grid_point_ref.get_children()[my_grid].get_children()[rng.randf_range(0.0, 4.0)].global_position

func _physics_process(delta: float) -> void:
	var direction = (go_to - global_position).normalized()
	
	if global_position.x >= go_to.x:
		global_position += direction * speed * delta

func take_damage(damage:int):
	hp -= damage
	
	if hp <= 0:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if  area is Player:
			if area.timer_invincibility.is_stopped():
				area.take_damage(1) 
