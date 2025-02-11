extends Control


func _ready():
	grab_focus()

func _on_Button_pressed(): #1
	Global.update_spawn(Vector2(4, -15))
	Global.count = 0
	Global.score = 0
	Global.time = 0
	Global.key_collected = false
	Global.rock_count = Global.original_rock_count
	get_tree().change_scene("res://World.tscn")

	


func _on_Button2_pressed():
	Global.update_spawn(Vector2(7911, -1044))
	Global.count = 0
	Global.score = 0
	Global.time = 0
	Global.key_collected = false
	Global.rock_count = Global.original_rock_count
	get_tree().change_scene("res://World.tscn")
	
	


func _on_Button3_pressed():
	Global.update_spawn(Vector2(14868, -2034))
	Global.count = 0
	Global.score = 0
	Global.time = 0
	Global.key_collected = false
	Global.rock_count = Global.original_rock_count
	get_tree().change_scene("res://World.tscn")
	

func _on_Button4_pressed():
	get_tree().change_scene("res://Menu.tscn")
