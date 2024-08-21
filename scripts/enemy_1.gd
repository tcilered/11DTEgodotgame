extends CharacterBody2D
var health = 20
@onready var Player = get_node("/root/Main/World/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(Player.global_position)
	velocity = direction * 20
	move_and_slide()

func play_walk():
	%AnimationPlayer.play("walk")

func play_death():
	%AnimationPlayer.play("death")

#func play_hurt():
#	%AnimationPlayer.play("walk")
#	%AnimationPlayer.queue("hurt")

func take_damage():
	health = health - 2
	#play_hurt()
	if health == 0:
		queue_free()

func _ready():
	play_walk()
