extends KinematicBody2D

var friction = 0.08
var acceleration = 0.5
var speed = 500
var velocity = Vector2()
var is_hold_tool = false
var is_hold_fire = false
var can_drop = true
signal firetool_showup(position)
signal toolbox_showup(position)
var is_playing = false 


func _physics_process(delta):
	get_input()
	dropfire()
	droptool()
	rotation = velocity.angle()
	move_and_slide(velocity)
	velocity.normalized()
	

func get_input():
	var x_dir = 0
	var y_dir = 0
	var rotation_dir = 0 
	if Input.is_action_pressed("ui_left"):
		x_dir -= 1
		if is_hold_fire:
			$AnimatedSprite.play("hold_fire_ex")
		elif is_hold_tool:
			$AnimatedSprite.play("hold_tool")
		else:
			$AnimatedSprite.play("run")
	
	elif Input.is_action_pressed("ui_right"):
		x_dir += 1
		if is_hold_fire:
			$AnimatedSprite.play("hold_fire_ex")
		elif is_hold_tool:
			$AnimatedSprite.play("hold_tool")
		else:
			$AnimatedSprite.play("run")
	
	elif Input.is_action_pressed("ui_down"):
		y_dir += 1
		if is_hold_fire:
			$AnimatedSprite.play("hold_fire_ex")
		elif is_hold_tool:
			$AnimatedSprite.play("hold_tool")
		else:
			$AnimatedSprite.play("run")
	
	elif Input.is_action_pressed("ui_up"):
		y_dir -= 1
		if is_hold_fire:
			$AnimatedSprite.play("hold_fire_ex")
		elif is_hold_tool:
			$AnimatedSprite.play("hold_tool")
		else:
			$AnimatedSprite.play("run")
	else:
		if is_hold_fire:
			$AnimatedSprite.play("fire_idle")
		elif is_hold_tool:
			$AnimatedSprite.play("tool_idle")
		else:
			$AnimatedSprite.play("idle")
	

	
	if x_dir != 0:
		velocity.x = lerp(velocity.x, x_dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		if is_playing:
			$AnimatedSprite.stop()
			is_playing = false
	if y_dir != 0:
		velocity.y = lerp(velocity.y, y_dir * speed, acceleration)
	else:
		velocity.y = lerp(velocity.y, 0, friction)
		if is_playing:
			$AnimatedSprite.stop()
			is_playing = false
		


func dropfire():
	if is_hold_fire and Input.is_action_pressed("ui_drop") and can_drop:
		is_hold_fire = false
		print("drop")
		print(self.transform)
		emit_signal("firetool_showup",self.global_position)

func droptool():
	if is_hold_tool and Input.is_action_pressed("ui_drop") and can_drop:
		is_hold_tool = false
		print('boxdrop')
		emit_signal("toolbox_showup",self.global_position)
		
	
func _on_firebox_hide():
	print("s")
	is_hold_fire = true
	can_drop = true
	
func _on_toolbox_hide():
	is_hold_tool = true
	can_drop = true

func _on_furniture_warning():
	print("warning")
