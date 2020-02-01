extends Area2D

var pickable = false

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		pickable = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_pick"):
		pickable = false
		queue_free()
				
