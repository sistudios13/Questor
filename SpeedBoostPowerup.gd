extends StaticBody2D

signal SpeedBoostPower

func _on_Area2D_body_entered(body):
	if body is Player:
		emit_signal("SpeedBoostPower")
		queue_free()
