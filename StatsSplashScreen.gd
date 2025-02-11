extends Control


func _ready():
	end_label_changes()
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().change_scene("res://Menu.tscn")
	
func end_label_changes():
	$LabelScore.text = str(Global.end_score)
	$LabelCoins.text = str(Global.end_count)
	$LabelTime.text = str(Global.end_time)
