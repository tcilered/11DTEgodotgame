extends CharacterBody2D
var health = 10
@onready var Player = get_node("/root/Main/World/Player")
const EXPERIENCE_GEM = preload("res://scenes/experience_gem.tscn")
const SLIME_DEATH = preload("res://scenes/slime_death.tscn")

func _physics_process(delta):
	var direction = global_position.direction_to(Player.global_position)
	velocity = direction * 20
	move_and_slide()

func take_damage():
	health = health - 2
	if health == 0:
		queue_free()
		var new_gem = EXPERIENCE_GEM.instantiate()
		new_gem.global_position = global_position
		add_sibling(new_gem)

func enemy_die():
	var new_slime_death = SLIME_DEATH.instantiate()
	new_slime_death.global_position = global_position 
	add_sibling(new_slime_death)
