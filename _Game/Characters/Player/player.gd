extends Area2D
class_name Player

signal spawn_laser(location)

signal special_spawn_laser(location)

##referencia do ponto inicial do tiro do player
@export var muzzle:Marker2D

##Referencia do timer do dash
@export var timer_dash:Timer

##Referencia do timer do FireRate
@export var timer_fire_rate:Timer

##Referencia do timer do FireRate
@export var timer_invincibility:Timer

##Referencia do timer do cooldown do shield
@export var timer_shield:Timer

##Referencia do timer do cooldown do shield
@export var timer_colldown_shield:Timer

@export var CollisionShield:CollisionShape2D

@export var AnimationPlayerSprite:AnimatedSprite2D

@export var ShieldSprite:Sprite2D

##Velocidade do player
@export var speed:float = 300.0

##Multiplicador do dash
@export var dash_speed_times:int = 3

##Vida do player
@export var hp:int = 5

##ponto para o especial
@export var sp:int = 0

##pontos necessário para usar o especial
@export var sp_needed_to_shoot:int = 100

##pontos ganho pela shield
@export var sp_point_by_shield:int = 20

## Duração do dash
@export var duration_dash:float = 1.0

## Duração do dash
@export var duration_invisibility:float = 0.5

## Cadência do tiro
@export var fire_rate:float = 0.25

##pontos ganho por tiro
@export var sp_point_by_shoot:int = 1

## Tempo do cooldown do shield
@export var cooldown_shield:float = 3.0

var input_vector:Vector2 = Vector2.ZERO


func _ready() -> void:
	AnimationPlayerSprite.play("Idle")
	init_timers()
	set_process(true)

func _physics_process(delta: float) -> void:
	update_move_input()
	
	#usando o dash
	if Input.is_action_just_pressed("dash"):
		dash()
	
	global_position += input_vector * speed * delta
	
	if Input.is_action_pressed("shoot") and timer_fire_rate.is_stopped():
		shoot()
	
	if Input.is_action_just_pressed("shield"):
		shield()
	
	if Input.is_action_just_pressed("special"):
		special_shoot()
		

func init_timers():
	timer_dash.set_wait_time(duration_dash)
	timer_fire_rate.set_wait_time(fire_rate)
	timer_invincibility.set_wait_time(duration_invisibility)
	timer_colldown_shield.set_wait_time(cooldown_shield)

func update_move_input():
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

func take_damage(damage:int):
	hp -= damage
	
	if hp <= 0:
		queue_free()

func shoot():
	emit_signal("spawn_laser", muzzle.global_position)
	timer_fire_rate.start()
	
func special_shoot():
	if sp >= sp_needed_to_shoot:
		sp = 0
		emit_signal("special_spawn_laser", muzzle.global_position)

func dash():
	timer_dash.start()
	timer_invincibility.start()
	speed *= dash_speed_times

func shield():
	if timer_colldown_shield.is_stopped():
		ShieldSprite.visible = true
		CollisionShield.disabled = false
		timer_colldown_shield.start()
		timer_shield.start()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enimies"):
		area.take_damage(1)

func _on_dash_timer_timeout() -> void:
	#reseta a velocidade
	speed /= dash_speed_times


func _on_shield_timeout() -> void:
	CollisionShield.disabled = true
	ShieldSprite.visible = false


func _on_area_colision_shield_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enimies"):
		area.take_damage(1)
		sp += sp_point_by_shield
		timer_colldown_shield.stop()
		
		
	
	
