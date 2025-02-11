extends Area2D

class_name coin

func _on_Coin_body_entered(body):
	queue_free()
