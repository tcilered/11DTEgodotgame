extends Node


func spawn_slime():
	var SLIME = preload("res://scenes/slime.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	SLIME.global_position = %PathFollow2D.global_position
	add_child(SLIME)


func _on_timer_timeout() -> void:
	spawn_slime()


func _on_player_health_depleated() -> void:
	%gameover.visable = true
	get_tree().paused = true
