extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		

func Shoot():
	const BULLET = preload("res://scenes/projectile_1.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %Shootingpoint.global_position
	new_bullet.global_rotation = %Shootingpoint.global_rotation
	%Shootingpoint.add_child(new_bullet)

func _on_timer_timeout() -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
			Shoot()
			#
