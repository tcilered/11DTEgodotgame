extends CharacterBody2D

@onready var Player = get_node("/root/Main/World/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(Player.global_position)
	velocity = direction * 20
	move_and_slide()
