
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
	$CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	var female = get_parent().get_parent().get_node("EnemyHolder/femaleninja4/femaleninja")
	female.hide()





func _physics_process(delta): 





 if is_on_wall() or $RayCast2D.is_colliding() == false:
	  EnemyDirection = EnemyDirection * OppositeDirection
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1



	if Input.is_action_pressed("ui_down") and $RayCast2D3.is_colliding() and is_dead == false:

			dead()
			var dead = get_parent().get_parent().get_node("EnemyHolder/femaleninja4/Particles2D3")
			dead.show()
			$Timer.start()
			var score = get_parent().get_parent().get_node("Player2/Player")
			score.score()







 if EnemyDirection == 1:
	  $femaleninja.flip_h = false
	  $femaleninja.play("run")


 elif EnemyDirection == -1:
	  $femaleninja.flip_h = true
	  $RayCast2D.scale.x *= -1
	  $RayCast2D2.scale.x *= -1
	  $femaleninja.play("run")




 EnemyMotion.x = EnemyDirection * EnemySpeed

 EnemyMotion = move_and_slide(EnemyMotion, UP)






func _on_Timer_timeout():
	queue_free()
