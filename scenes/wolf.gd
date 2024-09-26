extends CharacterBody2D
@onready var anim : AnimatedSprite2D = $"wolf animations"
var speed = 200
var accel = 3
var health = 10

var active: bool = false
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var player = get_node("/root/Main/World/Player")

func _physics_process(delta: float) -> void:
	var direction = Vector3()
	$NavigationAgent2D.target_position = player.global_position
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	
	#plays the animations for the player from the animatedsprite2d(player animations)
	if velocity.x > 0:
		anim.flip_h = true
		anim.play("move left")
	if velocity.x < 0:
		anim.flip_h = false
		anim.play("move left")
		
		
func _process(delta):
	pass
	move_and_slide()
	
func take_damage():
	health = health - 2
	if health == 0:
		anim.play("death")
		queue_free()
