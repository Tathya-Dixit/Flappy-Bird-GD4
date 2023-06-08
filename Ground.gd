extends Node2D

@onready var anim = $AnimationPlayer


func _on_static_body_2d_2_body_entered(body):
	if body.has_method("die"):
		body.die()
		anim.stop()
