extends Area2D

var pickable = false
#var is_on_hand = false
signal picktool


func _physics_process(delta):
	if pickable and Input.is_action_pressed("ui_pick"):
		hide()
		pickable = false


func _on_toolbox_body_entered(body):
	if body.get_name() == "Player":
		pickable = true
	pass # Replace with function body.


func _on_toolbox_body_exited(body):
	if body.get_name() == "Player":
		pickable = false
	pass # Replace with function body.


func _on_Player_toolbox_showup(position):
	print(position)
	pickable = true
	self.set_global_position(position)
	show()
