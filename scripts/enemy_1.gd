extends CharacterBody2D
var health = 10
@onready var Player = get_node("/root/Main/World/Player")
const EXPERIENCE_GEM = preload("res://scenes/experience_gem.tscn")
const SLIME_DEATH = preload("res://scenes/slime_death.tscn")
@onready var anim : AnimatedSprite2D = $"slime animations"

#moves the slime towards the player
func _physics_process(delta):
	var direction = global_position.direction_to(Player.global_position)
	velocity = direction * 20
	move_and_slide()
	
	#plays the animations if moving
	if velocity.x < 0:
		anim.play("jump")
	if velocity.x > 0:
		anim.play("jump")
	if velocity.y < 0:
		anim.play("jump")
	if velocity.y > 0:
		anim.play("jump")

#checks and updates health
func take_damage():
	health = health - 2
	if health == 0:
		anim.play("death")
		queue_free()
