extends Node


var bow_level = 10
var bow_damage = 5
var bow_speed = 500
var bow_projectiles = 1
var bow_time = 0.8
var bow_knockback = 10

func level_up_knife():
	bow_level +=1
	match bow_level:
		1:
			pass
		2:
			var bow_damage = 5
			var bow_speed = 500
			var bow_projectiles = 1
			var bow_time = 0.8
			var bow_knockback = 10
		3:
			var bow_damage = 7
			var bow_speed = 800
			var bow_projectiles = 1
			var bow_time = 0.6
			var bow_knockback = 20
