extends RichTextLabel

var ms =0
var s = 0
var m  = 0
var game_end = false

func _ready():
	get_node("Label").hide()
	get_node("AudioStreamPlayer2D").playing = true

func _process(delta):
	if ms>9:
		s+=1
		ms = 0
	
	if s>59:
		m+=1
		s = 0


	set_text(str(m)+":"+str(s)+":"+str(ms))



func _on_Timer_timeout():
	if game_end==false:
		ms +=1


func _on_furniture_game_end():
	game_end = true
	get_node("AudioStreamPlayer2D").stop()
	set_text("")
	get_node("Label").set_text(str(m)+":"+str(s))
	get_node("Label").show()
	
