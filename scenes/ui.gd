extends CanvasLayer
@onready var xp_bar: ProgressBar = %"xp bar"
@onready var experience = %"xp bar"
@onready var level_up_notice = $Control/level_up_notice
@onready var anim : AnimatedSprite2D = $Control/level_up_notice/countdown
@onready var player: CharacterBody2D = $".."
@onready var countdown: AnimatedSprite2D = $"../countdown"

func _ready():
	PlayerStats.level_up.connect(level_up)
	PlayerStats.add_xp.connect(update_xp)
	%"xp bar".value = PlayerStats.player_experience
	
	#tells when the xp bar resets and what value the xp bar should be at
func update_xp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience
	#makes the level up menu visable
func level_up():
	update_xp()
	level_up_notice.visible = true
#pauses time in the level up menu
func _on_level_up_notice_visibility_changed() -> void:
	countdown.global_position = player.global_position
	$"../countdown".play("11countdown")
	get_tree().paused = true
	await get_tree().create_timer(5).timeout
	get_tree().paused = false

#for max health upgrade
func _on_max_health_up_pressed() -> void:
	PlayerStats.add_max_health()
	level_up_notice.visible = false

#for damage upgrade
func _on_damage_up_pressed() -> void:
	Bow.level_up_bow()
	level_up_notice.visible = false
#for player speed upgrade
func _on_speed_up_pressed() -> void:
	pass # Replace with function body.
