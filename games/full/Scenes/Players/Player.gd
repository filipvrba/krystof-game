extends KinematicBody


var motion = Vector3()

export var player_id = 0

const SPEED = 500


func _physics_process( delta ):
	move(delta)


func move(delta):
	# Stop function if player_id not implemented.
	if player_id == 0:
		return
	
	motion = move_and_slide( get_motion() * SPEED * delta, Vector3.UP )


func get_motion():
	var x = Input.get_action_strength("right_%s" % player_id) -\
		Input.get_action_strength("left_%s" % player_id)
	var z = Input.get_action_strength("down_%s" % player_id) -\
		Input.get_action_strength("up_%s" % player_id)
	
	return Vector3( x, 0, z ).normalized()
