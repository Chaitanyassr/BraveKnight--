extends KinematicBody2D




export var EnemySpeed = 40
export var Gravity = 10





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


 if $RayCast2D2.is_colliding():
	 if $RayCast2D2.get_collider():
			var akyer2 = get_parent().get_parent().get_node("Player2/Player")
			
			#akyer2.destroy()
			#get_tree().reload_current_scene()
			#akyer2.health -= 1
			akyer2.TakeDamage(1)
			
			#queue_free()



	#if Input.is_action_pressed("ui_down") and $RayCast2D3.is_colliding():
	#		dead()
	#		var dead = get_parent().get_parent().get_node("EnemyHolder/MaleZombie/Particles2D2")
	#		dead.show()
	#		$Timer3.start()
 
  
   
  
  
 if EnemyDirection == 1:
	  $MaleZombie.flip_h = false
	  $MaleZombie.play("WalkingMale")


 elif EnemyDirection == -1:
	  $MaleZombie.flip_h = true
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1
	  $MaleZombie.play("WalkingMale")
  #$RayCast2D.position.x = 27
  #$RayCast2D2.position.x = 27
  

  
 EnemyMotion.x = EnemyDirection * EnemySpeed
 
 EnemyMotion = move_and_slide(EnemyMotion, UP)
 
 



#func _on_Enemy_0_hit():
 #hide()
 #$CollisionShape2D.disabled = true
 #queue_free()
 #pass # replace with function body


#func _on_Timer3_timeout():
	queue_free()
