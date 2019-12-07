extends Label

func _process(delta):
	if get_parent().get_name() == "Player":
		rect_position = get_parent().get_node("pos_text").rect_position

	self.visible_characters += 1

func _text(texto):
	self.text = texto
