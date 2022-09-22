extends KinematicBody2D

func _process(delta):
	position = Vector2(get_viewport().get_mouse_position().x,575)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var ballcount = get_tree().get_nodes_in_group("ball")
		if ballcount.size() == 0:
			var Ball = preload("res://Ball.tscn")
			var newBall = Ball.instance()
			get_parent().add_child(newBall)
		