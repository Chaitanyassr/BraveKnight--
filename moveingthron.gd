extends Area2D


#
func _physics_process(delta):
#
	var bodies = get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		if body.name == "Player":
			var cake = get_parent().get_parent().get_parent().get_node("Player2/Player")
			cake.finalblow()
			var player = get_parent().get_parent().get_parent().get_node("Player2/Player/Camera2D/ScreenShake")
			player.start()
			var red = get_parent().get_parent().get_parent().get_node("Player2/Player/Sprite/CanvasModulate")
			red.show()
