extends Label

func _ready():
	hide()

func _on_RichTextLabel_end():
	if hide():
		show()
	set_text(get_node("RichTextLabel").text)
