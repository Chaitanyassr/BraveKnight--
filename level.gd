extends Node2D



func _on_Button_pressed():
	$World1.start()
	$Button.hide()
	$Button2.hide()
	$Button4.hide()

	$load.show()
	pass # Replace with function body.


func _on_Button2_pressed():
	$World2.start()
	$World1.start()
	$Button.hide()
	$Button2.hide()
	$Button4.hide()

	$load.show()



func _on_Button3_pressed():
		get_tree().change_scene("res://StartMenu.tscn")



func _on_Button4_pressed():
	$World3.start()
	$World1.start()
	$Button.hide()
	$Button2.hide()
	$Button4.hide()

	$load.show()
	pass # Replace with function body.


func _on_World1_timeout():
	get_tree().change_scene("res://World.tscn")
	pass # Replace with function body.


func _on_World2_timeout():
	get_tree().change_scene("res://World2.tscn")
	pass # Replace with function body.


func _on_World3_timeout():
	get_tree().change_scene("res://World3.tscn")
	pass # Replace with function body.
