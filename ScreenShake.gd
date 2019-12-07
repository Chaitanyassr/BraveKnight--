extends Node

var amplitude = 0
var TRANS = Tween.TRANS_SINE
var EASE = Tween.EASE_IN_OUT
onready var Camera2D = get_parent()
var priority = 0

func start(duration = 1, timer = 15, amplitude = 16, priority = 0):
	if priority >= self.priority:
		self.priority = priority
		self.amplitude = amplitude

	
		$Duration.wait_time = duration
		$Timer.wait_time = 1 / float(timer)
		$Duration.start()
		$Timer.start()
		
		_new_shake()

func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	
	$ShakeTween.interpolate_property(Camera2D, "offset", Camera2D.offset, rand, $Timer.wait_time, TRANS, EASE)
	$ShakeTween.start()
	

func _reset():
	$ShakeTween.interpolate_property(Camera2D, "offset", Camera2D.offset, Vector2(200, 0), $Timer.wait_time, TRANS, EASE)
	#$ShakeTween.start()
	
	priority = 0

func _on_Timer_timeout():
	_new_shake()


func _on_Duration_timeout():
	_reset()
	$Timer.stop()
