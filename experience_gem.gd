extends Area2D
@export var experience_value = 5
var collected = false
@onready var player = get_tree().get_first_node_in_group("player")
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
		
