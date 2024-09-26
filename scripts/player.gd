extends CharacterBody2D
@onready var anim : AnimatedSprite2D = $"player animations"


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


func _on_pickup_zone_area_entered(area: Area2D) -> void:
	if area.is_in_group("pickup"):
		if area.has_method("collect"):
			area.collect()
			
			
	
