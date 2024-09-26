extends CharacterBody2D
signal health_depleated
@onready var anim : AnimatedSprite2D = $"player animations"
var health = 100.0
#gets the inputs and moves the player in the direction
func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down").normalized()
	velocity = direction * 200
	move_and_slide()

	#plays the animations for the player from the animatedsprite2d(player animations)
	if velocity.x < 0:
		anim.flip_h = true
		anim.play("move left")
	if velocity.x > 0:
		anim.flip_h = false
		anim.play("move left")
	if velocity.y < 0:
		anim.play("move forward")
	if velocity.y > 0:
		anim.play("move back")
	
	const DAMAGE_RATE = 5.0
	var overlapping_slimes = $Hurtbox.get_overlapping_bodies()
	if overlapping_slimes.size() > 0:
		health -= 10 + DAMAGE_RATE * overlapping_slimes.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleated.emit()
			#game over
