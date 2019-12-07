extends KinematicBody2D

#onready var joystick = get_parent().get_parent().get_node("touchscreen/lineDark02/TouchScreenButton")
'''defining var and const'''
var UP = Vector2(0, -1)
var motion = Vector2()
onready var score = scores.score1
var health = 4
var timer : float = 0
onready var animation = $Sprite
var jump = 0
#var ParticleSystem = null
#var player = null

'''function for the game'''
func _ready():
	set_physics_process(true)
	set_process(true)
	
	
#to call rich rect tile for score
func _process(delta):
	var LabelNode = get_parent().get_parent().get_node("ScoreCounter/UI/Base/Label")
	LabelNode.text = str(score)
	
	#ParticleSystem = get_parent().get_parent().get_node("Player2/Player/DeathParticle/Particles2D")
	#player = get_parent().get_parent().get_node("Player2/Player")
	



func _physics_process(delta):
	if(timer > 0): timer -= delta
	if(timer <= 0): timer = 0
		
		
	motion.y += 50 
	

	
	
	
	var friction = false
	
	
	
	
	
#we can also wirte code by using if else statement for lerp and friciton
#x+20 is acceleration and 500 is speed
		
	if Input.is_action_pressed("ui_down"):
		var sword = $sword
		sword.play()
		$swordtimer.start()
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x+20, 500)   
			$Sprite.flip_h = false
			$Sprite.play("Action")
			#var play = get_parent().get_parent().get_node("Effects/SlowTime")
			#play.start()
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x-20, -500)
			$Sprite.flip_h = true
			$Sprite.play("Action")
			#var play = get_parent().get_parent().get_node("Effects/SlowTime")
			#play.start()
		
			
		else:
			$Sprite.play("Action")
			#var play = get_parent().get_parent().get_node("Effects/SlowTime")
			#play.start()
			friction = true
			
			#var tt = get_parent().get_parent().get_node("EnemyHolder/Female")
			#tt.hide()
	
	elif Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+20, 500)   
		$Sprite.flip_h = false
		$Sprite.play("Run")
		



	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-20, -500)
	 $Sprite.flip_h = true
	 $Sprite.play("Run")
	
	
	
	else: 
		$Sprite.play("Idle")
		friction = true


	if motion.y < 0:
		$Sprite.play("Jump")
		
		
##double jump start code part 1
#	if jump == 3:
#		motion.y = 1000
#		jump = 0
#		$Sprite.play("jump")
#		if friction == true:
#			motion.x = lerp(motion.x, 0, 0.2)
##double jump end code part 1
		
	if is_on_floor():
		
##s##		#single jump main code
		if Input.is_action_just_pressed("ui_up"):
			var sound = $AudioStreamPlayer2D
			sound.play()
			motion.y = -1000
			$soundtimer.start()
	
		
			

###
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		$Sprite.play("Jump")
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
###
###		#sky walk
#		if Input.is_action_just_pressed("ui_up"):
#			motion.y = -1000
#
##
#		if friction == true:
#			motion.x = lerp(motion.x, 0, 0.2)
#	elif Input.is_action_just_pressed("ui_up"):
#		motion.y = -1000
#		$Sprite.play("Jump")
#		if friction == true:
#				motion.x = lerp(motion.x, 0, 0.2)
#
##double jump part 2 code
#		if Input.is_action_just_pressed("ui_up"):
#			jump = 1
#			motion.y = -1000
#			$Sprite.play("Jump")
##
###
#		if friction == true:
#			motion.x = lerp(motion.x, 0, 0.2)
#	elif Input.is_action_just_pressed("ui_up"):
#		if jump < 2:
#			jump += 1
#			motion.y = -1000
#			$Sprite.play("Jump")
#		if friction == true:
#				motion.x = lerp(motion.x, 0, 0.2)
#	else:
#		friction = true
#		$Sprite.play("Jump")
		
##double jump part 2 code end

				
				

	
	
		
	

	motion = move_and_slide(motion, UP)
	


func destroy():
	queue_free()

#func TakeDamage():
	#health -= 1 
	#if (health == 3):
	#	var heart1 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/1")
	#	heart1.hide()
		
		
	#if (health == 2):
	#	var heart2 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/2")
	#	heart2.hide()
		
	#if (health == 1):
		#queue_free()
		#var heart3 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/3")
		#heart3.hide()
		#get_tree().reload_current_scene()

func TakeDamage(amount):
    if(timer == 0):
        health-=amount
    
        if (health == 3):
                var heart1 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/1")
                heart1.hide()
                var player = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
                player.start()
                var play = get_parent().get_parent().get_node("Effects/SlowTime")
                play.start()
                flash()
                var dead = $dead
                dead.play()
                $dead2.start()
                #animation.queue("animation sprite")  if we want our animation to be palyed afterwards

        elif (health == 2):
                var heart2 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/2")
                heart2.hide()
                var playe = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
                playe.start()
                var play = get_parent().get_parent().get_node("Effects/SlowTime")
                play.start()
                flash()
                var dead = $dead
                dead.play()
                $dead2.start()
        elif (health == 1):
                var heart3 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/3")
                heart3.hide()
                finalblow()
                var play = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
                play.start()
                $CanvasModulate.show()
                var dead = $dead
                dead.play()
                $dead2.start()
    timer = 1 #how long you want the time between hits to be in seconds
    
	
		
		
func restroehealth():
	if (health == 3):
		var h1 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/1")
		h1.show()
		
		#var screen = get_parent().get_parent().get_node("ScreenShake")
		
		
		
	if (health == 2):
		var h2 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/2")
		h2.show()
		
	if (health == 1):
		var h3 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/3")
		h3.show()
			



func _on_Coin_G_body_entered(body):
	
	scores.score1 += 6
	score += 6
	print(score)
	var sound = $AudioStreamPlayer2D2
	sound.play()
	$soundtimer1.start()
	
	
	
#func _on_MaleZombie2_body_entered(body):
#	ParticleSystem.position = Vector2(player.position.x+3, player.position.y+3)
#	player.hide()
#	ParticleSystem.show()
#	yield(get_tree().create_timer(ParticleSystem.lifetime), "timeout")
#	get_tree().reload_current_scene()
func can_move():
	set_physics_process(false)
	
func dead():
	$Sprite.play("Action")
	
func finalblow():
	var ayer2 = get_parent().get_parent().get_node("Player2/Player")
	var ParticleSystem = get_parent().get_parent().get_node("Player2/Player/DeathParticle/blasty")
	ParticleSystem.show()
	#$MaleZombie2.play("AttackZ")
	ayer2.can_move()
	yield(get_tree().create_timer(ParticleSystem.lifetime), "timeout")
	get_tree().reload_current_scene()
	scores.score1 = 0

	

	
#func qq():
#	$Sprite.play("Dead")
#func score():
	
	#var scor = get_parent().get_parent().get_node("EnemyHolder/MaleZombie2/RayCast2D3")
	#if scor.is_colliding() and Input.is_action_pressed("ui_down"):
#		score += 30
#		$Timer2.start()
		

#see how we can modify the Sprite as a var and can use it with a methode..and we can combine tohse methode in a function to create
#a bigger methode
#func Flash():
#	animation.hide()
#	animation.show()
	
#func on_take_damage():
    # Flicker 4 times
 #   for i in 4:
  #      self_modulate.a = 0.5
   #     yield(get_tree(), "idle_frame")
    #    self_modulate.a = 3.0
     #   yield(get_tree(), "idle_frame")


func _on_Coin_S_body_entered(body):
	scores.score1 += 3
	score += 3
	print(score)
	var sound = $AudioStreamPlayer2D2
	sound.play()
	$soundtimer1.start()
	pass # Replace with function body.


func _on_Coin_B_body_entered(body):
	scores.score1 += 1
	score += 1
	print(score)
	var sound = $AudioStreamPlayer2D2
	sound.play()
	$soundtimer1.start()
	pass # Replace with function body.



	



func score():
	print(score)
	scores.score1 += 100
	score += 100
	
func flash():
	$timer.start()
	$CanvasModulate.show()


#func _on_area2daction_area_entered(area):
#	score += 1000000
#	print(score)


func _on_timer_timeout():
	$CanvasModulate.hide()
	




func _on_Area2D_body_entered(body):
	if body.get_name() == get_name():
		var story1 = get_parent().get_parent().get_node("story/CanvasLayer/Control")
		story1.show()
		




func _on_Area2D_body_exited(body):
	if body.get_name() == get_name():
		var story2 = get_parent().get_parent().get_node("story/CanvasLayer/Control")
		story2.hide()
	


func _on_soundtimer_timeout():
	var sound = $AudioStreamPlayer2D
	sound.stop()


func _on_soundtimer1_timeout():
	var sound = $AudioStreamPlayer2D2
	sound.stop()


func _on_soundtimer3_timeout():
	var sound = $AudioStreamPlayer2D3
	sound.stop()


func _on_dead2_timeout():
	var dead = $dead
	dead.stop()


func _on_swordtimer_timeout():
	var sword = $sword
	sword.stop()
	

func _on_Sword_pressed():
			motion.x = min(motion.x+20, 500)   
			$Sprite.flip_h = false
			$Sprite.play("Run")
	





func _on_control_body_entered(body):
	if body.get_name() == get_name():
		var contr = get_parent().get_parent().get_node("controls/CanvasLayer/Control")
		contr.show()
		var actiontimer = get_parent().get_parent().get_node("controls/action")
		actiontimer.start()
		
	pass # Replace with function body.


func _on_action_timeout():
	var con = get_parent().get_parent().get_node("controls/CanvasLayer/Control")
	con.hide()
