extends KinematicBody2D

var friction = 0.08
var acceleration = 0.5
var speed = 500
var velocity = Vector2()
var is_hold_tool = false
func _physics_process(delta):
	get_input()
	rotation = velocity.angle()
	move_and_slide(velocity)
	velocity.normalized()


func get_input():
	var x_dir = 0
	var y_dir = 0
	var rotation_dir = 0 
	if Input.is_action_pressed("ui_left"):
		x_dir -= 1
	if Input.is_action_pressed("ui_right"):
		x_dir += 1
	if Input.is_action_pressed("ui_down"):
		y_dir += 1
	if Input.is_action_pressed("ui_up"):
		y_dir -= 1
	
	if x_dir != 0:
		velocity.x = lerp(velocity.x, x_dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	if y_dir != 0:
		velocity.y = lerp(velocity.y, y_dir * speed, acceleration)
	else:
		velocity.y = lerp(velocity.y, 0, friction)
	
func is_hold_tools():
	if Input.is_action_pressed("ui_pick"):
		is_hold_tool = true if is_hold_tool == false else false
