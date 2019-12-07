extends Control



#func _on_StartGameButton_pressed():

	  
	


#func _on_QuitGameButton_pressed():
#	 get_tree().quit()

#func _on_Option_pressed():
	#get_tree().change_scene("")
#




func _on_Button_pressed():
	get_tree().change_scene("res://level.tscn")

	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()

	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().change_scene("res://steetings.tscn")
	pass # Replace with function body.


func _on_Button3_pressed():
	get_tree().change_scene("res://about.tscn")
	


func _on_Button4_pressed():
	get_tree().change_scene("res://steetings.tscn")
	


func _on_level_pressed():
	get_tree().change_scene("res://level.tscn")
