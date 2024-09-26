extends Area2D


@export var experience_value = 5
var collected = false
@onready var player = get_tree().get_first_node_in_group("player")

func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 * delta)
			
func _collect():
	collected = true
	
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
		
