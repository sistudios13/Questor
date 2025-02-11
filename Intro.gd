extends Node2D



func _ready():
	$AnimationPlayer.play("Fading")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Menu.tscn")

