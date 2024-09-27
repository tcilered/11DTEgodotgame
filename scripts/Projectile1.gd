extends Area2D

var travelled_distance = 0


func _physics_process(delta):
	const SPEED = 250
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta

	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

#detecting for overlaps on mask 4(bullets) then lowering health
func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
