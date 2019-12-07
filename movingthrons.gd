
extends KinematicBody2D


	
var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1
var EnemySpeed = 600

func _ready():
 set_physics_process(true)


func _physics_process(delta):
	
	

	
	 if is_on_wall():
		  EnemyDirection = EnemyDirection * OppositeDirection
		  $cake.flip_h = false
		 
#	  $RayCast2D2.scale.x *= -1
	
	 if EnemyDirection == 1:
		  $cake.flip_h = false
		  
#	  $Female.play("Female")

#ray cast are projection act like a part of collision shape
	 elif EnemyDirection == -1:
		  $cake.flip_h = true
		  
#	  $RayCast2D2.scale.x *= -1
#	  $Female.play("Female")

	
	


  
	 EnemyMotion.x = EnemyDirection * EnemySpeed
 
	 EnemyMotion = move_and_slide(EnemyMotion, UP)
 