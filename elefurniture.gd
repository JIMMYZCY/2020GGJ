extends Area2D
var is_on_fire = false
var can_off_fire = false
const fire_num = 3
var temp = 0
var ms = 0
var s = 0
var s2 = 0
var ms2 = 0
signal warning
	
func _process(delta):
	randomize()
	if ms > 9:
		s += 1
		ms = 0
	if ms2 > 9:
		s2 += 1
		ms2 = 0
		temp = randi()%3 + 1
		print(temp)
		if temp == fire_num:
			on_fire()
	if s >= 40:
		print("Boom")
	if is_on_fire == false:
		ms = 0
		s = 0
	if can_off_fire and Input.is_action_pressed("ui_fix"):
		can_off_fire = false
		is_on_fire = false
		print("ele off")
	
func on_fire():
	if not is_on_fire:
		emit_signal("warning")
		is_on_fire = true
	print("is_on_ele")
	
	

func _on_furniture_body_entered(body):
	print(str(body.is_hold_tool) + "hold tool")
	if body.is_hold_tool and is_on_fire:
		can_off_fire = true

	

func _on_Timer_timeout():
	if is_on_fire == true:
		ms += 1

func _on_Timer2_timeout():
	ms2 += 1