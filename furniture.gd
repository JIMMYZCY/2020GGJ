extends RigidBody2D
var is_on_fire = false
var can_off_fire = false
const fire_num = 3
var temp = 0
var ms = 0
var s = 0
var s2 = 0
var ms2 = 0
	
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
	detect()
	
func on_fire():
	is_on_fire = true
	print("is_on_fire")
	

#func _on_furniture_body_entered(body):
#	print(body.is_hold_fire)
#	if body.is_hold_fire and is_on_fire and Input.is_action_pressed("ui_fix"):
#		print("fire off")
#		is_on_fire = false

func detect():
	var body = get_colliding_bodies()
	print(body)
	

func _on_Timer_timeout():
	if is_on_fire == true:
		ms += 1

func _on_Timer2_timeout():
	ms2 += 1
