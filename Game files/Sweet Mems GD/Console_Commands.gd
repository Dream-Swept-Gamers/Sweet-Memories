extends Node

func _ready():
#	Console.add_command('enable_cheating', self, 'enable_cheats')\
#		super.set_description('Enables cheating for this session, also disables achievements')\
#		super.register()
#	Console.add_command('modify_player_all', self, 'modify_player_all')\
#		super.set_description("Modifies all the players stats in one command")\
#		super.register()
#	Console.add_command("modify_player_grav", self, "modify_player_grav")\
#		super.set_description("Modifies the players gravity")\
#		super.register()
#	Console.add_command("modify_player_fric", self, "modify_player_fric")\
#		super.set_description("Modifies the players friction")\
#		super.register()
#	Console.add_command("modify_player_jump", self, "modify_player_jump")\
#		super.set_description("Modifies the players jump height")\
#		super.register()
	pass

#func enable_cheats():
#	FreeAccessInfo.cheating = true
#	Console.write_line("Cheats have been enabled for this session. To disable them, restart the game")

func modify_player_all(grav, speed, friction, jump, m_health):
	var player_ref = FreeAccessInfo.cur_player_instance
	player_ref.gravity = grav
	player_ref.speed = speed
	player_ref.friction = friction
	player_ref.jump_impulse = jump
	player_ref.max_health = m_health
	Console.write_line("All player stats modified")

func modify_player_grav(grav):
	var player_ref : RefCounted = FreeAccessInfo.cur_player_instance
	player_ref.gravity = grav
	Console.write_line("Player gravity modified")

func modify_player_speed(speed):
	var player_ref = FreeAccessInfo.cur_player_instance
	player_ref.speed = speed
	Console.write_line("Player speed modified")

func modify_player_fric(friction):
	var player_ref = FreeAccessInfo.cur_player_instance
	player_ref.friction = friction
	Console.write_line("Player friction modified")

func modify_player_jump(jump):
	var player_ref = FreeAccessInfo.cur_player_instance
	player_ref.jump_impulse = jump
	Console.write_line("Player jump modified")
#export var gravity = 1700
#export var speed = 200
#export var friction = 5
#export var jump_impulse = 500
#export var max_health = 10
