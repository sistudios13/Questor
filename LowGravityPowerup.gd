extends StaticBody2D

signal LowGravityPower

func _on_Area2D_body_entered(body):
	if body is Player:
		emit_signal("LowGravityPower")
		$Area2D/AudioStreamPlayer.play()
		queue_free()
		
		
		
