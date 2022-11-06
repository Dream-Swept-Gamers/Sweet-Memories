extends CharacterBody2D

@export var gravity = 1700
@export var speed = 200
@export var friction = 5
@export var jump_impulse = 150# * 2
@export var max_health = 10

@export var boing = false
var bouncing = false

enum {
	IDLE,
	BOUNCE,
}

var state = IDLE
var cur_velocity = Vector2.ZERO
var cur_health = max_health
var can_jump = true

var move_type = 0
var random = RandomNumberGenerator.new()
var Player_char = RefCounted
var the_area = RefCounted

@onready var ground_ray0 = get_node("R_Jump_cast")
@onready var ground_ray = get_node("L_Jump_cast")
@onready var ground_ray2 = get_node("M_Jump_cast")
@onready var animator = get_node("AnimationPlayer")



func _ready():
	animator.play("Idle")
	pass

func _physics_process(delta):
	cur_velocity.x = 0
	cur_velocity.y = cur_velocity.y + gravity * delta
	
	match state:
		IDLE: pass
		
		BOUNCE: bounce()
		
	
	set_velocity(cur_velocity)
	move_and_slide()
	cur_velocity = velocity

func is_grounded():
	if ground_ray.is_colliding() or ground_ray0.is_colliding() or ground_ray2.is_colliding():
		return true
	else:
		return false

func bounce():
	if not bouncing:
		bouncing = true
		animator.play("Bounce")
	if bouncing and boing and is_grounded():
		cur_velocity.y -= jump_impulse
		Player_char.cur_velocity.y = Player_char.cur_velocity.y - (jump_impulse * 2)
		
		#Input.action_press("Move_Jump")
	#elif bouncing and boing and not is_grounded():
	#	bouncing = false
	#	pass
	
	pass


func _on_Area2D_area_entered(area):
	Player_char = area.get_parent()
	state = BOUNCE
	var A2D = get_node("Area2D")
	#A2D.monitoring = false
	A2D.set_deferred("monitoring", false)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Bounce":
		bouncing = false
		state = IDLE
		boing = false
		animator.play("Idle")
		var A2D = get_node("Area2D")
		A2D.monitoring = true

func boing_true():
	if is_grounded() or true == true:
		cur_velocity.y -= jump_impulse
