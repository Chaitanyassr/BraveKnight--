extends KinematicBody2D
#
#
var EnemyMotion = Vector2(0,-1)
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1
var EnemySpeed = 500
#
func _ready():
 set_physics_process(true)
#
#
func _physics_process(delta):
#
#
#
#
	 if is_on_floor() or is_on_ceiling():
		  EnemyDirection = EnemyDirection * OppositeDirection
#
#
#
##	
#
	 if EnemyDirection == 1:
		  $cake2.flip_h = false
#
	 elif EnemyDirection == -1:
		  $cake2.flip_h = false
#
#
#
#
#
#
#
#
#
#
#
	 EnemyMotion.y = EnemyDirection * EnemySpeed
#
	 EnemyMotion = move_and_slide(EnemyMotion, UP)