extends CharacterBody2D

var speed = 300
var accel = 7

var active: bool = false
@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var player = get_node("/root/Main/World/Player")

func _physics_process(delta: float) -> void:
	var direction = Vector3()
	$NavigationAgent2D.target_position = get_global_mouse_position()
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * speed, accel * delta)

func _process(delta):
	pass
	move_and_slide()

func _on_notice_area_body_entered(body: Node2D) -> void:
	pass
	active = true


func _on_notice_area_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass
	active = false
