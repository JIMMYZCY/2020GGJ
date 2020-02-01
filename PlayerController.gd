extends KinematicBody2D

var friction = 0.08
var acceleration = 0.5
var speed = 500
var velocity = Vector2()
var is_hold_tool = false
var is_hold_fire = false
signal firetool_showup 
signal toolbox_showup
var is_playing = false 
func _ready():
	connect("firetool_showup",$"firetools.tscn","fire_show_up")


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
		if not is_playing:
			$AnimatedSprite.play("run")
			is_playing = true
	if Input.is_action_pressed("ui_right"):
		x_dir += 1
		if not is_playing:
			$AnimatedSprite.play("run")
			is_playing = true
	if Input.is_action_pressed("ui_down"):
		y_dir += 1
		if not is_playing:
			$AnimatedSprite.play("run")
			is_playing = true
	if Input.is_action_pressed("ui_up"):
		y_dir -= 1
		if not is_playing:
			$AnimatedSprite.play("run")
			is_playing = true
	

	
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
		
	
func hold_toolbox():
	if Input.is_action_pressed("ui_pick"):
		is_hold_tool = true if is_hold_tool == false else false
	if is_hold_tool == false:
		emit_signal("toolbox_showup")
		#print(is_hold_tool)
	return is_hold_tool
		
func hold_fire():
	if Input.is_action_pressed("ui_pick"):
		is_hold_fire = true if is_hold_fire == false else false
	if is_hold_fire == false:
		emit_signal("firetool_showup")
		print(is_hold_fire)
	return is_hold_fire
