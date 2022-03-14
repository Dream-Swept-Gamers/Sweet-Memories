extends KinematicBody2D

export var gravity = 1700
export var speed = 200
export var friction = 5
export var jump_impulse = 500
export var max_health = 10

enum {
	MOVE,
	ATTACK,
}

var state = MOVE
var cur_velocity = Vector2.ZERO
var cur_health = max_health
var can_jump = true

onready var ray_1 = get_node("CollisionShape2D/RayCast2D")
onready var ray_2 = get_node("CollisionShape2D/RayCast2D2")
onready var animator = get_node("AnimationPlayer")



func _ready():
	pass

func _physics_process(delta):
	cur_velocity.x = 0
	cur_velocity.y = cur_velocity.y + gravity * delta
	
	match state:
		MOVE: move()
		
		ATTACK: attack()
		
	
	cur_velocity = move_and_slide(cur_velocity)

func move():
	
	if Input.is_action_pressed("Move_Left"):
		cur_velocity.x -= speed
		animator.play("Move_Left")
	else: if Input.is_action_pressed("Move_Right"):
		cur_velocity.x += speed
		animator.play("Move_Right")
	else: animator.play("Idle")
	if Input.is_action_just_pressed("Move_Jump") and can_jump:
		cur_velocity.y -= jump_impulse
		can_jump = false
	
	if is_grounded() == true:
		can_jump = true
	else: can_jump = false
	

func attack():
	pass

func is_grounded():
	if ray_1.is_colliding() or ray_2.is_colliding():
		return true
	else:
		return false
