extends KinematicBody2D


'''defining var and const'''
var UPs = Vector2(0, -1)
var motion = Vector2()
onready var score = scores.score1
var health = 4
var timer : float = 0
onready var animation = $Sprite
var jump = 0
var run = 0

#var snap = Vector2(0, 32)
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
		var swordsound = get_parent().get_parent().get_node("sounds/sword")
		swordsound.play()
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
		run += 1
		if Input.is_action_just_pressed("ui_accept"):
			motion.x = min(motion.x+10000, 10000000000000)
			run += 1
		



	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-20, -500)
	 $Sprite.flip_h = true
	 $Sprite.play("Run")
	 run = 1
		if Input.is_action_just_pressed("ui_accept"):
			motion.x = min(motion.x-10000, 100000)
			run += 1
	
	
	
	else:
		$Sprite.play("Idle")
		friction = true


	if motion.y < 0:
		$Sprite.play("Jump")
	if Input.is_action_just_pressed("ui_up"):
			var jump = get_parent().get_parent().get_node("sounds/jump")
			jump.play()
			$jump.start()
		
##double jump start code part 1
	if jump == 3:
		motion.y = 1000
		jump = 0
		$Sprite.play("jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
	
##double jump end code part 1
##

	if is_on_floor():
		
####		#single jump main code
#		if Input.is_action_just_pressed("ui_up"):
#			motion.y = -1000
###
#		if friction == true:
#			motion.x = lerp(motion.x, 0, 0.2)
#	else:
#		$Sprite.play("Jump")
#		if friction == true:
#				motion.x = lerp(motion.x, 0, 0.2)
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
		if Input.is_action_just_pressed("ui_up"):

			jump = 1
			motion.y = -1000
			$Sprite.play("Jump")
			
#
##
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	elif Input.is_action_just_pressed("ui_up"):

		if jump < 2:
			jump += 1
			motion.y = -1000
			$Sprite.play("Jump")

		if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
	else:
		friction = true
		$Sprite.play("Jump")

##double jump part 2 code end

	motion = move_and_slide(motion, UPs)

#	var slope_threshold := 50.0
#
#	var snap_vector = Vector2(0, 32) if snap else Vector2()
#	motion = move_and_slide_with_snap(motion,snap_vector, UPs, slope_threshold)

#	motion = move_and_slide_with_snap(motion, UPs, snap)

	


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
 #               var player = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
  #              player.start()
                var play = get_parent().get_parent().get_node("EnemyHolder/Effects/SlowTime")
                play.start()
                var dead = get_parent().get_parent().get_node("AI/Particles2D3")
                dead.show()
                flash()
                var thunder = get_parent().get_parent().get_node("sounds/Thunder")
                thunder.play()
                $thunder.start()
               
                #animation.queue("animation sprite")  if we want our animation to be palyed afterwards

        elif (health == 2):
                var heart2 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/2")
                heart2.hide()
   #             var playe = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
    #            playe.start()
                var play = get_parent().get_parent().get_node("EnemyHolder/Effects/SlowTime")
                play.start()
                flash()
                var dead = get_parent().get_parent().get_node("AI/Particles2D4")
                dead.show()
                flash()
                var thunder = get_parent().get_parent().get_node("sounds/Thunder")
                thunder.play()
                $thunder.start()
        elif (health == 1):
                var heart3 = get_parent().get_parent().get_node("ScoreCounter/UI/Base/3")
                heart3.hide()
                finalblow()
                $CanvasModulate.show()
                var thunder = get_parent().get_parent().get_node("sounds/Thunder")
                thunder.play()
                $thunder.start()
     #           var play = get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
      #          play.start()
             
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
	var coinsound = get_parent().get_parent().get_node("sounds/coin")
	coinsound.play()
	$coin.start()
	pass # Replace with function body.
	
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
	var coinsound = get_parent().get_parent().get_node("sounds/coin")
	coinsound.play()
	$coin.start()
	pass # Replace with function body.


func _on_Coin_B_body_entered(body):
	scores.score1 += 1
	score += 1
	print(score)
	var coinsound = get_parent().get_parent().get_node("sounds/coin")
	coinsound.play()
	$coin.start()
	pass # Replace with function body.



	


func score():
	scores.score1 += 100
	print(score)
	score += 100
	
func score1():
	scores.score1 += 200
	print(score)
	score += 200
	
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
		var story = get_parent().get_parent().get_node("story/CanvasLayer/Control")
		story.show()
		
		

	


func _on_Area2D_body_exited(body):
	if body.get_name() == get_name():
		var stroyarea = get_parent().get_parent().get_node("story/CanvasLayer/Control")
		stroyarea.hide()
	


func _on_jump_timeout():
	var jump = get_parent().get_parent().get_node("sounds/jump")
	jump.stop()


func _on_coin_timeout():
	var coinsound = get_parent().get_parent().get_node("sounds/coin")
	coinsound.stop()



func _on_thunder_timeout():
	var thunder = get_parent().get_parent().get_node("sounds/Thunder")
	thunder.stop()
	


func _on_sword_timeout():
	var swordsound = get_parent().get_parent().get_node("sounds/sword")
	swordsound.stop()
	pass # Replace with function body.
