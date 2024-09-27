extends Control

##func _process(delta: float) -> void:
	##$VBoxContainer/retrybutt.grab_click_focus()
	
	
#starts the game for start button
func _on_retrybutt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

#shuts down the game for quit button
func _on_quitbutt_pressed() -> void:
	get_tree().quit()
