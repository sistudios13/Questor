extends Control

func _on_Back_Button_pressed():
	get_tree().change_scene("res://Menu.tscn")



func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		Global.player_sprite = "blue"
		$BlueSprite.show()
		$OwletSprite.hide()
	if not button_pressed:
		Global.player_sprite = "owlet"
		$BlueSprite.hide()
		$OwletSprite.show()


func _ready():
	$OwletSprite.hide()
	if Global.player_sprite == "blue":
		$CheckBox.pressed = true
	if Global.player_sprite == "owlet":
		$CheckBox.pressed = false
