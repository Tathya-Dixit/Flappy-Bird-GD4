extends Node2D

@onready var spawner = $nightSpawner
@onready var hud = $hud
@onready var grndanim = $Node2D/AnimationPlayer
var score = 0 
const filepath = "user://score.save"
var best = 0
@onready var gos = $nightGameOver


func _ready():
	spawner.obsSpawned.connect(obstacleSpawned)
	hud.setBest(best)
	best = loadBest()
	if best == null:
		saveBest(0)

func _on_character_dead():
	grndanim.stop()
	spawner.stop()
	get_tree().call_group("obstacles","set_physics_process",false)
	if score > best:
		best=score
		hud.setBest(best)
		saveBest(best)
	gos.setscores(score,best)
	await get_tree().create_timer(2).timeout
	gos.visible=true
	

func _on_character_started():
	spawner.start()
	best=loadBest()

func obstacleSpawned(obs):
	obs.score.connect(scorepoint)

func scorepoint():
	score += 1
	hud.setScore(score)
	if score<=100:
		spawner.updatetimeout()
	

func saveBest(scr):
	FileAccess.open(filepath,FileAccess.WRITE).store_var(scr)


func loadBest():
	if FileAccess.file_exists(filepath):
		var file = FileAccess.open(filepath,FileAccess.READ)
		best = file.get_var()
		return best
