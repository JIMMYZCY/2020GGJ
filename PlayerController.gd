extends KinematicBody2D

var friction = 0.08
var acceleration = 0.5
var speed = 500
var velocity = Vector2()
var is_hold_tool = false
var is_hold_fire = false
signal firetool_showup(position)
var is_playing = false 


func _physics_process(delta):
	get_input()
	drop()
	rotation = velocity.angle()
	move_and_slide(velocity)
	velocity.normalized()
	

func get_input():
	var x_dir = 0
	var y_dir = 0
	var rotation_dir = 0 
	if Input.is_action_pressed("ui_left"):
		x_dir -= 1
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_right"):
		x_dir += 1
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_down"):
		y_dir += 1
		$AnimatedSprite.play("run")
		
	elif Input.is_action_pressed("ui_up"):
		y_dir -= 1
		$AnimatedSprite.play("run")
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
		


func drop():
	if is_hold_fire and Input.is_action_pressed("ui_drop"):
		is_hold_fire = false
		print("drop")
		print(self.transform)
		emit_signal("firetool_showup",self.global_position)


func _on_firebox_hide():
	print("s")
	is_hold_fire = true
	
