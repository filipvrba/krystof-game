extends Spatial

var player1_score = 0
var player2_score = 0


func reset_pitch():
	get_tree().call_group("game_pieces", "reset")


func _on_Area_body_entered(body, player_id):
	print( player_id )
	get_tree().call_group("game_pieces", "freeze", true)
	$Timer.start()
	update_score( player_id )

func _on_Timer_timeout():
	reset_pitch()


func update_score( player_id ):
	var new_score
	
	match player_id:
		1:
			player1_score += 1
			new_score = player1_score
		2:
			player2_score += 1
			new_score = player2_score
	
	$GUI.update_score( player_id, new_score )
