extends RigidBody2D

var brickcount
var speedup = 5
var maxspeed = 370

func _ready():
	friction = 0
	bounce = 1
	gravity_scale = 0
	
	mode = MODE_CHARACTER
	linear_damp = 0
	position = get_parent().get_node("Paddle/Anchor").global_position - Vector2(0,20)
	contact_monitor = true
	contacts_reported = 1
	brickcount = get_tree().get_nodes_in_group("bricks").size()
	
func _process(delta):
	if position.y > get_viewport_rect().end.y:
		queue_free()
		get_parent().lifelost()

func _on_Ball_body_entered(body):
	if body.is_in_group("bricks"):
		body.queue_free()
		brickcount -= 1
		get_parent().scoreup()
		get_node("bounce").play()
	if brickcount == 0:
		queue_free()
		get_parent().levelup()
		
	if body.get_name() == "Paddle":
		var speed = linear_velocity.length()
		var direction = position - get_parent().get_node("Paddle/Anchor").global_position
		linear_velocity = direction.normalized() * min(speed + speedup, maxspeed)