extends RigidBody2D

var isStarted = false
signal dead
signal started
var gravity = 3
@onready var anim = $AnimationPlayer
@onready var flapaud = $FlapAudio
@onready var hitaud = $HitAudio
@onready var dieaud = $DieAudio
@export var Force = -700
var isalive = true

func _physics_process(delta):
	if Input.is_action_just_pressed("Flap") && isalive:
		if isStarted:
			flap()
		else:
			start()
		
	if rotation_degrees <= -30:
		angular_velocity=0
		rotation_degrees = -30
	
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 5
		else:
			angular_velocity = 0

func start():
	flap()
	isStarted=true
	emit_signal("started")


func flap():
	anim.play("Flap")
	flapaud.play()
	gravity_scale = gravity
	linear_velocity.y = Force
	angular_velocity = -10


func die():
	if !isalive: return
	isalive = false
	emit_signal("dead")
	hitaud.play()
	dieaud.play()
	
func score():
	pass
