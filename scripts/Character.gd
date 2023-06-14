extends RigidBody2D

var isStarted = false
signal dead
signal started
var gravity = 4
@onready var anim = $AnimationPlayer
@onready var flapaud = $FlapAudio
@onready var hitaud = $HitAudio
@onready var dieaud = $DieAudio
@onready var scoreaud = $Score
@export var Force = -800
var isalive = true

func _physics_process(delta):
	if Input.is_action_just_pressed("Flap") && isalive:
		if isStarted:
			flap()
		else:
			start()
		
	
	if !isalive:
		if rotation_degrees <= 90:
			angular_velocity = 5
		else:
			angular_velocity = 0

func start():
	flap()
	isStarted=true
	emit_signal("started")


func flap():
	flapaud.play()
	anim.play("Flap")
	gravity_scale = gravity
	linear_velocity.y = Force


func die():
	if !isalive: return
	isalive = false
	hitaud.play()
	emit_signal("dead")
	dieaud.play()
	
func score():
	scoreaud.play()
