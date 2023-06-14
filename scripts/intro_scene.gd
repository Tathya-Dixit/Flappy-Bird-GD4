extends Node2D


func _ready():
#	$AnimationPlayer.play("fadein")
#	await get_tree().create_timer(4).timeout
	$AnimationPlayer.play("fadeout")
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

