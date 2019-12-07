extends KinematicBody2D

var ParticleSystem = null
var player = null

export var EnemySpeed = 40
export var Gravity = 10

var is_dead = false



var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1





func _ready():
 set_physics_process(true)


func dead():
	is_dead = true
	EnemySpeed = 0
	EnemyMotion = Vector2(0, 0)
	$Area2D/CollisionShape2D.disabled = true
	$CollisionShape2D.disabled = true
	var female = get_parent().get_parent().get_node("EnemyHolder/MaleZombie2/MaleZombie2")
	female.hide()
	var female2 = get_parent().get_parent().get_node("EnemyHolder/MaleZombie2/RayCast2D2")
	female2.hide()
	


	 
	
	

	
#func _process(delta):
 #for i in range(get_slide_count()):
  #if "Player2" in get_slide_collision(i).collider.name:
   #var player2 = get_parent().get_parent().get_node("Player2/Player")
   #player2.TakeDamage()
   #queue_free()
  

func _physics_process(delta): 
 

 
 
 #EnemyMotion.y += Gravity
 if is_on_wall() or $RayCast2D.is_colliding() == false:
	  EnemyDirection = EnemyDirection * OppositeDirection
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1

  #$RayCast2D.position.x = OppositeDirection * 27
  #$RayCast2D2.position.x = -27

#enemy will kill player by using raycast ...not needed as now i m using area2d
# if $RayCast2D2.is_colliding():
#	#if $RayCast2D2.get_collider():
#			var ayer2 = get_parent().get_parent().get_node("Player2/Player")
#			ayer2.TakeDamage(1)
#			if(ayer2.health == 3):
#				$MaleZombie2.play("AttackZ")
#
			

			#ParticleSystem.show()
			#$MaleZombie2.play("AttackZ")
			#ayer2.can_move()
			#yield(get_tree().create_timer(ParticleSystem.lifetime), "timeout")
			#get_tree().reload_current_scene()
#	
#	player.hide()
#	ParticleSystem.show()
#	yield(get_tree().create_timer(ParticleSystem.lifetime), "timeout")
#	get_tree().reload_current_scene()
			
			

	if Input.is_action_pressed("ui_down") and $RayCast2D3.is_colliding() and is_dead == false:
			
			dead()
			var dead = get_parent().get_parent().get_node("EnemyHolder/MaleZombie2/Particles2D2")
			dead.show()
			$Timer.start()
			var score = get_parent().get_parent().get_node("Player2/Player")
			score.score()
			var sound = get_parent().get_parent().get_node("Player2/Player/AudioStreamPlayer2D3")
			sound.play()
			var timer = get_parent().get_parent().get_node("Player2/Player/soundtimer3")
			timer.start()
			
	
			
  
   
  
  
 if EnemyDirection == 1:
	  $MaleZombie2.flip_h = false
	  $MaleZombie2.play("WalkingMale2")


 elif EnemyDirection == -1:
	  $MaleZombie2.flip_h = true
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1
	  $MaleZombie2.play("WalkingMale2")
  #$RayCast2D.position.x = 27
  #$RayCast2D2.position.x = 27
  

  
 EnemyMotion.x = EnemyDirection * EnemySpeed
 
 EnemyMotion = move_and_slide(EnemyMotion, UP)
 
 



#func _on_Enemy_0_hit():
 #hide()
 #$CollisionShape2D.disabled = true
 #queue_free()
 #pass # replace with function body

 # Replace with function body.


func _on_Timer_timeout():
	queue_free()

func kill():
	$MaleZombie2.play("AttackZ")
