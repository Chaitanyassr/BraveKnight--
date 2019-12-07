
extends KinematicBody2D

var ParticleSystem = null
var player = null

export var EnemySpeed = 600
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
	var female = get_parent().get_parent().get_node("EnemyHolder/iceman8/iceman")
	female.hide()
	var female2 = get_parent().get_parent().get_node("EnemyHolder/iceman8/RayCast2D3")
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
#
			dead()
			var dead = get_parent().get_parent().get_node("EnemyHolder/iceman8/Particles2D2")
			dead.show()
			$Timer.start()
			var score = get_parent().get_parent().get_node("Player2/Player")
			score.score()
			var kill = get_parent().get_parent().get_node("Sound/enemykill")
			kill.play()
			var timer = get_parent().get_node("Timerking")
			timer.start()
#
	
			
  
   
  
  
 if EnemyDirection == 1:
	  $iceman.flip_h = false
	  $iceman.play("attack")


 elif EnemyDirection == -1:
	  $iceman.flip_h = true
	  $RayCast2D.scale.x *= -1
	
	  $iceman.play("attack")
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
	$iceman.play("attack")