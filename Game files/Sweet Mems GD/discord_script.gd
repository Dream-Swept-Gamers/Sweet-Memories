extends Node

var core: Discord.Core
var discord: Discord.Core
var activities: Discord.ActivityManager

func enum_to_string(the_enum: Dictionary, value: int) -> String:
	var index: = the_enum.values().find(value)
	var string: String = the_enum.keys()[index]
	return string

func _ready() -> void:
	core = Discord.Core.new()
	var result: int = core.create(
		953652201572687903,
		Discord.CreateFlags.DEFAULT
	)
	print("Created Discord Core: ", enum_to_string(Discord.Result, result))
	if result != Discord.Result.OK:
		core = null
	var activity: = Discord.Activity.new()
	activity.timestamps.start = Time.get_unix_time_from_system()
	activity.state = "Testing Sweet Memories"
	activity.details = "Implimenting Discord Rich Presence"
	activity.assets.large_image = "Monster"
	activity.assets.large_text = "Dream Swept Gamers"
	
	activities.update_activity(activity)

func _process(delta: float) -> void:
	if core:
		var result: int = core.run_callbacks()
		if result != Discord.Result.OK:
			print("Callbacks failed: ", enum_to_string(Discord.Result, result))


func _update_activity_callback(result: int) -> void:
	if result != Discord.Result.OK:
		print("Failed to update activity: ", result)
		return

	print("Successfully updated the current activity!")
