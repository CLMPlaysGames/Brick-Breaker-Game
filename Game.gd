extends Node2D

var level
var lives
var score

func _ready():
	lives = 3
	level = 1
	score = 0
	get_node("UI/Victory").hide()
	get_node("UI/Defeat").hide()
	
func scoreup():
	score += 1
	get_node("UI/Score").text = "sCORE : " + str(score)
	
func lifelost():
	lives -= 1
	get_node("UI/Lives").text = "LIVES : " +str(lives)
	get_node("Fall").play()
	if lives == 0:
		get_node("UI/Defeat").show()
		get_node("Paddle").queue_free()
		
func levelup():
	get_node("Level" + str(level)).queue_free()
	level += 1
	var Bricks = load("res://Level" + str(level) + ".tscn")
	if Bricks == null:
		get_node("UI/Victory").show()
		get_node("Paddle").queue_free()
	else:
		var NewBricks = Bricks.instance()
		add_child(NewBricks)