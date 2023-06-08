extends CanvasLayer
const filepath = "user://score.save"



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Main.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")



func setscores(current,best):
	$BestScore.text = "BEST : "+str(best)
	$CurrentScore.text = "CURRENT : "+str(current)
