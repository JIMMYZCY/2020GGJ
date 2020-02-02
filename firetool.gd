extends Area2D

var pickable = false
var dropable = false
#var is_on_hand = false
signal pickfire

func _on_firebox_body_entered(body):
	if body.get_name() == "Player":
		if body.is_hold_tool:
			body.can_drop = false
		elif body.get_name() == "Player":	
			pickable = true
	

func _on_firebox_body_exited(body):
	if body.get_name() == "Player":
		pickable = false
		body.can_drop = true
		
func _physics_process(delta):
	if pickable and Input.is_action_just_pressed("ui_pick"):
		hide()
		pickable = false
		
		

func _on_Player_firetool_showup(position):
	pickable = true
	self.set_global_position(position)
	show()



