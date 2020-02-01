extends StaticBody2D
var is_on_fire = false
var can_off_fire = false
var ms
var s
	
func _process(delta):
	if ms > 9:
		s += 1
	if s >= 40:
		pass
	if is_on_fire == false:
		ms = 0
		s = 0		
	
func on_fire():
	is_on_fire = true
	
func _on_furniture_body_entered(body):
	if get_node("res://Player.tscn").is_hold_fire and is_on_fire:
		can_off_fire = true

func off_fire():
	if can_off_fire and is_on_fire:
		is_on_fire = false

func _on_Timer_timeout():
	if is_on_fire == true:
		ms += 1
