
extends KinematicBody2D

onready var Player = get_parent().get_parent().get_node("Player2/Player")
'''defining var and const'''
var UP = Vector2(0, -1)
var motion = Vector2()
var score = 0
var health = 4
var timer : float = 0

var is_dead = false
var react_time = 400
var next_direction = 0
var direction = 0
var next_dir_time = 0
var next_jump_time = -1
var eye_reach = 10
var vision = 1
var EnemySpeed = 1420 
'''function for the game'''
func _ready():
	set_physics_process(true)
	set_process(true)

func dead():
	is_dead = true
	EnemySpeed = 0
	motion = Vector2(0, 0)
	$Area2D/CollisionShape2D.disabled = true
	$CollisionShape2D.disabled = true
	var female = get_parent().get_node("AI3/AnimatedSprite")
	female.hide()


func set_dir(target_dir):
	if next_direction != target_dir:
		next_direction = target_dir
		next_dir_time = OS.get_ticks_msec() + react_time

func _physics_process(delta):








	motion.y += 50 




	var move = false 
	var friction = false



#

	if Player.position.x < position.x + EnemySpeed: 
		set_dir(-1)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	elif Player.position.x > position.x - EnemySpeed:
		set_dir(1)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")



	else:
		set_dir(0)
#	
		friction = true
		motion.x = 0

	if OS.get_ticks_msec() > next_dir_time:
		direction = next_direction
	if OS.get_ticks_msec() > next_jump_time and next_jump_time != -1 and is_on_floor():
#	
		if Player.position.y < position.y - 64:
			motion.y = -1000
		next_jump_time = -1

	motion.x = direction * 500


	if Player.position.y < position.y - 64 and next_jump_time == -1:
			next_jump_time = OS.get_ticks_msec() + react_time


	if is_on_floor() and motion.y > 0:
		motion.y = 0

	if Input.is_action_pressed("ui_down") and $RayCast2D.is_colliding() and $RayCast2D2.is_colliding() and is_dead == false:
		dead()
		var AI = get_parent().get_node("AI3/Particles2D3")
		AI.show()
		var score = get_parent().get_node("Player2/Player")
		score.score1()
		var kill = get_parent().get_parent().get_node("Sound/enemykill")
		kill.play()
		var timer = get_parent().get_node("Timerking")
		timer.start()







	motion = move_and_slide(motion, UP)
























