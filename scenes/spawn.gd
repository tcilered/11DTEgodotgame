extends Node


@onready var gameover: CanvasLayer = %gameover
#spawns slimes along the path2D
func spawn_slime():
	var SLIME = preload("res://scenes/slime.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	SLIME.global_position = %PathFollow2D.global_position
	add_child(SLIME)

func _on_slime_spawn_rate_timeout() -> void:
	spawn_slime()
