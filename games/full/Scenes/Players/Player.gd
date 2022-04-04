extends KinematicBody


var motion = Vector3()
var can_move = false
var my_spawn

export var player_id = 0

const SPEED = 500


func _ready():
	my_spawn = get_tree().get_root().find_node("Player%sStart" % player_id,
		true, false)


func _physics_process( delta ):
	move(delta)
	animate()
	face_forward(delta)


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
	
	if not can_move:
		return Vector3( x, 0, z ).normalized()
	else:
		return Vector3.ZERO


func animate():
	if motion.length() > 0:
		$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()


func face_forward( delta ):
	if not motion.x == 0 or not motion.z == 0:
		look_at( Vector3( -motion.x, 0, -motion.z ) * SPEED * delta , Vector3.UP )


func freeze( value ):
	can_move = value


func reset():
	freeze( false )
	translation = my_spawn.translation
	rotation = my_spawn.rotation
