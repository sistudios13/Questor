extends Control



func _ready():
	VisualServer.set_default_clear_color(Color.lightblue)
	$HBoxContainer/StartButton.grab_focus()
	if Global.player_sprite == "blue":
		$OwletGuy.hide()
		$DudeMonster.show()
	if Global.player_sprite == "owlet":
		$OwletGuy.show()
		$DudeMonster.hide()
	

func _on_StartButton_pressed():
	get_tree().change_scene("res://LevelPick.tscn")





func _on_QuitButton_pressed():
	get_tree().quit()





func _on_QuitButton2_pressed():
	get_tree().change_scene("res://godot-credits-master/GodotCredits.tscn")


func _on_OptionButton_pressed():
	get_tree().change_scene("res://OptionMenu.tscn")
