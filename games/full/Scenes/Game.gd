extends Spatial


func reset_pitch():
	get_tree().call_group("game_pieces", "reset")


func _on_Area_body_entered(body, player_id):
	print( player_id )
	get_tree().call_group("game_pieces", "freeze", true)
	$Timer.start()

func _on_Timer_timeout():
	reset_pitch()
