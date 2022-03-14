extends KinematicBody2D

export var gravity = 1700
export var speed = 200
export var friction = 5
export var jump_impulse = 150
export var max_health = 10

enum {
	MOVE,
	ATTACK,
}

var state = MOVE
var cur_velocity = Vector2.ZERO
var cur_health = max_health
var can_jump = true

var move_type = 0
var random = RandomNumberGenerator.new()

onready var wall_ray = get_node("CollisionShape2D/RayCast2D")
onready var ground_ray = get_node("CollisionShape2D/RayCast2D2")
onready var player_detect = get_node("CollisionShape2D/PlayerDetect")
onready var animator = get_node("AnimationPlayer")
onready var move_time = get_node("Timer")



func _ready():
	rand_move()
	pass

func _physics_process(delta):
	cur_velocity.x = 0
	cur_velocity.y = cur_velocity.y + gravity * delta
	
	match state:
		MOVE: move()
		
		ATTACK: attack()
		
	
	cur_velocity = move_and_slide(cur_velocity)

func move():
	
	if move_type == 1:
		cur_velocity.x -= speed
		animator.play("Move_Left")
	else: if move_type == 2:
		cur_velocity.x += speed
		animator.play("Move_Right")
	else: animator.play("Idle")
	
	if wall_ray.is_colliding() and can_jump and move_type != 3:
		cur_velocity.y -= jump_impulse
		can_jump = false
	
	if is_grounded() == true:
		can_jump = true
	else: can_jump = false
	

func attack():
	pass

func is_grounded():
	if ground_ray.is_colliding():
		return true
	else:
		return false

func rand_move():
	move_type = random.randi_range(0, 2)
	move_time.start(random.randf_range(0.2, 1.8))
	pass

func _on_Timer_timeout():
	rand_move()
	pass # Replace with function body.
