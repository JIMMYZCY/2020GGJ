extends Area2D

var pickable = false
signal picktool
func _ready():
	connect("picktool",$"Player.tscn","hold_tool")

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		pickable = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_pick"):
		emit_signal("picktool")
		pickable = false
		hide()
		
func tool_show_up(postion):
	print(position)
	var x_pos = position.x
	var y_pos = position.y
	self.transform.x = x_pos
	self.transform.y = y_pos
	show()	
				
				
	
