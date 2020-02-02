extends RichTextLabel

var ms =0
var s = 0
var m  = 0
var game_end = false

func _process(delta):
	if ms>9:
		s+=1
		ms = 0
	
	if s>59:
		m+=1
		s = 0
	if game_end == true:
		pass


	set_text(str(m)+":"+str(s)+":"+str(ms))




func _on_Timer_timeout():
	if game_end==false:
		ms +=1
	pass # Replace with function body.
