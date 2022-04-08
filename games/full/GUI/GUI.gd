extends CanvasLayer

func update_score( player, score ):
	var score_label = get_node("Banner/HBoxContainer/Player%sScore" % player)
	score_label.text = str( score )


func _on_Button_pressed():
	reset_game_signal()


func game_over(player_id):
	var label = $Popup/VBoxContainer/Label
	label.text = "Player%s wins!" % str(player_id)
	$Popup.popup_centered()


func _on_Popup_popup_hide():
	reset_game_signal()


func reset_game_signal():
	get_tree().reload_current_scene()
