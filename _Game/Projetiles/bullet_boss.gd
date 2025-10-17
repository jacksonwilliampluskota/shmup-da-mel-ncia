extends Area2D
class_name Kamikaze

@export var speed:float = 200.0

##Vida do bullet sniper fly
@export var hp:int = 1

##Vida do bullet sniper fly
@export var damage_bullet:int = 1

@export var my_grid:GlobalConfigWord.grid_spawnable_enimies = GlobalConfigWord.grid_spawnable_enimies.GRID_3

@export var AnimationControler:AnimatedSprite2D

var player_ref:Player
var player_position:Vector2

var grid_point_ref
var grid_position_line:int
var grid_max_distanceX:float 

var kamikaze = false

func _ready() -> void:
	
	AnimationControler.play("Idle")
	if player_ref != null:
		player_position = player_ref.global_position
		
	if grid_point_ref != null:
		grid_max_distanceX = grid_point_ref.get_children()[my_grid].get_children()[grid_position_line].global_position.x

func _physics_process(delta: float) -> void:
	if global_position.x > grid_max_distanceX:
		if player_ref != null:
			var direction = (player_position - global_position).normalized()
			global_position += direction * speed * delta
			
	
	if kamikaze:
		if player_ref != null:
			var direction = (player_position - global_position).normalized()
			global_position += direction * (speed *1.5) * delta
		

func take_damage(damage:int):
	hp -= damage
	if hp <= 0:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if  area is Player:
			if area.timer_invincibility.is_stopped():
				area.take_damage(1) 
		queue_free()


func _on_timer_timeout() -> void:
	kamikaze = true
