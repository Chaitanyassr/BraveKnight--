extends KinematicBody2D




export var EnemySpeed = 40
export var Gravity = 10


#var is_dead = false


var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1

var is_dead = false



func _ready():
 set_physics_process(true)
 
func dead():
	is_dead = true
	EnemySpeed = 0
	EnemyMotion = Vector2(0, 0)
	$CollisionShape2D.disabled = true
	var female = get_parent().get_parent().get_node("EnemyHolder/Female/Female")
	female.hide()
	var female2 = get_parent().get_parent().get_node("EnemyHolder/Female/RayCast2D2")
	female2.hide()
	var score = get_parent().get_parent().get_node("Player2/Player")
	score.score()
	
	
	
	
	#$Timer.start()

	
	#$Female.play("DEAD") 
#func _process(delta):

  

func _physics_process(delta): 

	#for i in range(get_slide_count()):
	#	  if "Player2" in get_slide_collision(i).collider.name:
	#		   var player2 = get_parent().get_parent().get_node("Player2/Player")
	#		   player2.TakeDamage()
	#		   queue_free()
  
 if Input.is_action_pressed("ui_down") and $RayCast2D3.is_colliding():
			dead()
			var dead = get_parent().get_parent().get_node("EnemyHolder/Female/Particles2D")
			dead.show()
			$Timer.start()
			

 
 
 #EnemyMotion.y += Gravity
 if is_on_wall() or $RayCast2D.is_colliding() == false:
	  EnemyDirection = EnemyDirection * OppositeDirection
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1

  #$RayCast2D.position.x = OppositeDirection * 27
  #$RayCast2D2.position.x = -27
#i have replace destroy from take damage function as i dont want my player to get destroy instantly as destroy function uses queue free
	#if $RayCast2D2.is_colliding():
	#	 for i in range(get_slide_count()):
	#		  if "Player2" in get_slide_collision(i).collider.name:
	#			   var player2 = get_parent().get_parent().get_node("Player2/Player")
	#			   player2.health -= 1
	#			   player2.TakeDamage()
	#			   queue_free()

 if $RayCast2D2.is_colliding():
	# if $RayCast2D2.get_collider():
			var ayer = get_parent().get_parent().get_node("Player2/Player")
			#ayer.health -= 1
			ayer.TakeDamage(1)
			#var screen = get_parent().get_parent().get_node("ScreenShake")
			#screen._new_shake()
			#ayer.qq()
			#queue_free()
			
#var aye = get_parent().get_parent().get_node("Player2/Player")
#		 if $RayCast2D3.is_colliding() and aye. attack() == true:=
#			if $RayCast2D3.get_collider():
#		queue_free()
#queue free is used to kill kinamatic body and end the game while hide is used to kill object like area2d and clooision shape

  
   
  
  
 if EnemyDirection == 1:
	  $Female.flip_h = false
	  $Female.play("Female")

#ray cast are projection act like a part of collision shape
 elif EnemyDirection == -1:
	  $Female.flip_h = true
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1
	  $Female.play("Female")
  #$RayCast2D.position.x = 27
  #$RayCast2D2.position.x = 27
  

 #move and slide is used to access up and enemymotion 
 EnemyMotion.x = EnemyDirection * EnemySpeed
 
 EnemyMotion = move_and_slide(EnemyMotion, UP)
 
 



#func _on_Enemy_0_hit():
 #hide()
 #$CollisionShape2D.disabled = true
 #queue_free()
 #pass # replace with function body



#func _on_Timer_timeout():
#	queue_free()



