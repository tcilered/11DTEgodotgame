extends CharacterBody2D
var health = 100.0

signal health_depleted

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 200
	move_and_slide()

	const DAMAGE_RATE = 5.0

	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		if health <= 0.0:
			health_depleted.emit()
