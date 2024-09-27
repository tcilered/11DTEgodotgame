extends Control
##func _process(delta: float) -> void:
	##$VBoxContainer/startbutt.grab_click_focus()
	
	
#starts the game for quit button
func _on_startbutt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
#shuts down the game for quit button
func _on_quitbutt_pressed() -> void:
	get_tree().quit()
