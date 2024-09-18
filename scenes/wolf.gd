extends CharacterBody2D

var active: bool = false
@onready var player = get_node("/root/Main/World/Player")

func _ready():
	$NavigationAgent2D.target_position = player.global_rotation
	print($NavigationAgent2D.get_current_navigation_path())

func _process(delta):
	
	move_and_slide()

func _on_notice_area_body_entered(body: Node2D) -> void:
	active = true


func _on_notice_area_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	active = false
