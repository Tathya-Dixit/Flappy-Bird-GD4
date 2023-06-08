extends Node2D

func _ready():          
	$AnimationPlayer.play("fadein")
	await get_tree().create_timer(5).timeout
	$ColorRect.visible = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
