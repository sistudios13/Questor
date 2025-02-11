extends Label

var time_elapsed = 0.0

var score = 0

func _process(delta):
	time_elapsed += delta
	score = Global.count / time_elapsed * 100000
	text = str(round(score))
	Global.score = str(round(score))
