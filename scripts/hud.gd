extends CanvasLayer

@onready var Score = $Score
@onready var Best = $Best
const filepath = "user://score.save"

func _physics_process(delta):
	setBest(loadBest())
	
func setScore(score):
	Score.text = str(score)

func setBest(best):
	Best.text = "BEST : "+str(best)

func loadBest():
	if FileAccess.file_exists(filepath):
		var file = FileAccess.open(filepath,FileAccess.READ)
		var best = file.get_var()
		file.close()
		return best
