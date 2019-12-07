extends Node2D
var score = scores.score1
func _ready():
	set_physics_process(true)
	set_process(true)

func _process(delta):
	var LabelNode = get_node("CanvasLayer/Label2")
	LabelNode.text = str(score)

func _on_TouchScreenButton_pressed():
	get_tree().change_scene("res://StartMenu.tscn")
