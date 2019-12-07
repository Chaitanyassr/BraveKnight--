extends Control


func _ready():
	$resume.grab_focus()

	
	
func _physics_process(delta):
	if $resume.is_hovered() == true:
		$resume.grab_focus()
	if $quit.is_hovered() == true:
		$quit.grab_focus()
	
	
	
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$resume.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible
	


func _on_quit_pressed():
	get_tree().change_scene("res://StartMenu.tscn")

func _on_resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
