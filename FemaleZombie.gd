extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var EnemySpeed = 40
export var Gravity = 10

var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0, -1)
var OppositeDirection = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	
	#EnemyMotion.y += Gravity
	
	if is_on_wall() or $RayCast2D.is_colliding() == false:
		EnemyDirection = EnemyDirection * OppositeDirection
		#$RayCast2D.scale.x *= -1
		$RayCast2D.scale.x *= -1
	



	if EnemyDirection == 1:
		$FemaleZombie.flip_h = true
		$FemaleZombie.play("WalkingFemale")

	elif EnemyDirection == -1:
		$FemaleZombie.flip_h = false
		$FemaleZombie.play("WalkingFemale")
		#$RayCast2D.scale.x *= -1
		$RayCast2D.scale.x *= -1


	EnemyMotion.x = EnemyDirection * EnemySpeed

	EnemyMotion = move_and_slide(EnemyMotion, UP)
	pass