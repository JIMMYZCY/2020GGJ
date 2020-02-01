extends Area2D

var pickable = false
signal pickfire
func _ready():
	connect("pickfire",$"Player.tscn","hold_fire")

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		pickable = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_pick"):
		hide()
		emit_signal("pickfire")
		pickable = false
		
		
func fire_show_up(postion):
	var x_pos = position.x
	var y_pos = position.y
	self.transform.x = x_pos
	self.transform.y = y_pos
	show()	
				
				
	
