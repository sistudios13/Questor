extends Area2D



func _on_CreditsDoor_body_entered(body):
	global_end_changes()
	get_tree().change_scene("res://StatsSplashScreen.tscn")

func global_end_changes():
	Global.end_count = Global.count
	Global.end_score = Global.score
	Global.end_time = Global.time
