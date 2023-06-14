extends Node2D

var Obs = preload("res://scenes/nightobstacle.tscn")
signal obsSpawned(obs)


func _ready():
	randomize()
	

func _on_timer_timeout():
	spawnObstacle()

	

func spawnObstacle():
	var obs = Obs.instantiate()
	add_child(obs)
	obs.position.y = randi()%500+350
	emit_signal("obsSpawned",obs)

func updatetimeout():
	$Timer.wait_time-=0.01
	

func start():
	spawnObstacle()
	$Timer.start()
	print("working")

func stop():
	$Timer.stop()


