extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Coin_S_body_entered(body):
	queue_free()
