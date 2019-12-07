extends KinematicBody2D


'''defining var and const'''
var UP = Vector2(0, -1)
var motion = Vector2()
var score = scores.score1
var health = 4
var timer : float = 0

var jump = 0
var is_up = false
var is_wall_sliding = false
var fly = true
var swim = false
var skate = false
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
		var sowrd = get_parent().get_parent().get_node("Sound/sword")
		sowrd.play()
		$sword.start()
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
#swim code
	if swim:
		fly = false
		$Sprite.play("Jump")
#		motion.x = 200
		motion.y = 100
		if Input.is_action_just_pressed("ui_up"):
			motion.y += -3000
			if friction == true:
				motion.y = lerp(motion.y, 0, 0.2)
				
#skate code
	if skate:
		$Sprite.play("Idle")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -1000
			$Sprite.play("Jump")
			
		if Input.is_action_pressed("ui_left"):
			motion.x += -1000
		if Input.is_action_pressed("ui_right"):
			motion.x += 1000
		



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
#		if Input.is_action_just_pressed("ui_up"):
#			motion.y = -1000
###
#		if friction == true:
#			motion.x = lerp(motion.x, 0, 0.2)
#	else:
#		$Sprite.play("Jump")
#		if friction == true:
#				motion.x = lerp(motion.x, 0, 0.2)

###		#sky walk
		if Input.is_action_just_pressed("ui_up") and fly == true:
			var jump = get_parent().get_parent().get_node("Sound/jump")
			jump.play()
			$jumpt.start()
			motion.y = -1000
			$flysky.start()

##
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	elif Input.is_action_just_pressed("ui_up") and fly == true:
		var jump = get_parent().get_parent().get_node("Sound/jump")
		jump.play()
		$jumpt.start()
		motion.y = -1000
		$Sprite.play("Jump")
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
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

                var play = get_parent().get_parent().get_node("SlowTime")
                play.start()
                flash()
                var thunder = get_parent().get_parent().get_node("Sound/thunder")
                thunder.play()
                $thunder.start()
                #animation.queue("animation sprite")  if we want our animation to be palyed afterwards

        elif (health == 2):
                var heart2 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/2")
                heart2.hide()

                var play = get_parent().get_parent().get_node("SlowTime")
                play.start()
                flash()

                var thunder = get_parent().get_parent().get_node("Sound/thunder")
                thunder.play()
                $thunder.start()
        elif (health == 1):
                var heart3 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/3")
                heart3.hide()
                finalblow()
                var play = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
                play.start()
                var end = get_parent().get_parent().get_node("Player2/Player/Sprite/CanvasModulate")
                end.show()
                var thunder = get_parent().get_parent().get_node("Sound/thunder")
                thunder.play()
                $thunder.start()
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
	var sound = get_parent().get_parent().get_node("Sound/coin")
	sound.play()
	$soundt.start()
	
	
	
#func _on_MaleZombie2_body_entered(body):
#	ParticleSystem.position = Vector2(player.position.x+3, player.position.y+3)
#	player.hide()
#	ParticleSystem.show()
#	yield(get_tree().create_timer(ParticleSystem.lifetime), "timeout")
#	get_tree().reload_current_scene()

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

	



func _on_Coin_S_body_entered(body):
	scores.score1 += 3
	score += 3
	print(score)
	var sound = get_parent().get_parent().get_node("Sound/coin")
	sound.play()
	$soundt.start()
	pass # Replace with function body.


func _on_Coin_B_body_entered(body):
	scores.score1 += 1
	score += 1
	print(score)
	var sound = get_parent().get_parent().get_node("Sound/coin")
	sound.play()
	$soundt.start()
	pass # Replace with function body.


func can_move():
	set_physics_process(false)
	$Sprite.hide()
	



func score():
	scores.score1 += 300
	print(score)
	score += 300

#func _on_area2daction_area_entered(area):
#	score += 1000000
#	print(score)


func _on_flysky_timeout():
	motion.y = 100
	fly = false
	$newfly.start()

	
func flash():
	$Sprite/CanvasModulate.show()
	$Timer.start()
	

	





func _on_newfly_timeout():
	fly = true
	








func _on_swimArea_body_entered(body):
		if body.get_name() == get_name():
			swim = true



func _on_swimArea_body_exited(body):
		if body.get_name() == get_name():
			swim = false





func _on_skate_body_entered(body):
	if body.get_name() == get_name():
		skate = true


func _on_skate_body_exited(body):
		if body.get_name() == get_name():
			skate = false



	




func _on_Timer_timeout():
	$Sprite/CanvasModulate.hide()
	
	



func _on_Area2D_body_entered(body):
	if body.get_name() == get_name():
		var story = get_parent().get_parent().get_node("story/CanvasLayer/Control")
		story.show()
		

	
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.get_name() == get_name():
		var storyarea = get_parent().get_parent().get_node("story/CanvasLayer/Control")
		storyarea.hide()
		


func _on_area2d2_body_entered(body):
	if body.get_name() == get_name():
		 var storyarea = get_parent().get_parent().get_node("story2/CanvasLayer/Control")
		 storyarea.show()
		

	

func _on_area2d2_body_exited(body):
	if body.get_name() == get_name():
		 var storyarea1 = get_parent().get_parent().get_node("story2/CanvasLayer/Control")
		 storyarea1.hide()


func _on_aaa_body_entered(body):
	if body.get_name() == get_name():
		 var storyarea1 = get_parent().get_parent().get_node("story4/CanvasLayer/Control")
		 storyarea1.hide()


func _on_aaa_body_exited(body):
	if body.get_name() == get_name():
		 var storyarea1 = get_parent().get_parent().get_node("story4/CanvasLayer/Control")
		 storyarea1.hide()


func _on_jumpt_timeout():
	var jump = get_parent().get_parent().get_node("Sound/jump")
	jump.stop()


func _on_soundt_timeout():
	var sound = get_parent().get_parent().get_node("Sound/coin")
	sound.stop()



func _on_sword_timeout():
	var sowrd = get_parent().get_parent().get_node("Sound/sword")
	sowrd.stop()


func _on_thunder_timeout():
	var thunder = get_parent().get_parent().get_node("Sound/thunder")
	thunder.stop()



func _on_Timerking_timeout():
	var sound = get_parent().get_parent().get_node("Sound/enemykill")
	sound.stop()

