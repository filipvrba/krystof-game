extends RigidBody

var my_spawn


func _ready():
	my_spawn = get_tree().get_root().find_node("BallSpawn", true, false)


func reset():
	translation = my_spawn.translation
	freeze( false )

func freeze( value ):
	axis_lock_linear_x = value
	axis_lock_linear_y = value
	axis_lock_linear_z = value
