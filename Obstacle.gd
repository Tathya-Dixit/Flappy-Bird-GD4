extends Node2D

@export var Speed = 289
signal score

func _physics_process(delta):
	position.x -= Speed*delta
	if position.x <= -900:
		queue_free()




func _on_pipe_body_entered(body):
	if body.has_method("die"):
		body.die()


func _on_area_2d_body_exited(body):
	if body.has_method("score"):
		emit_signal("score")
		body.score()
