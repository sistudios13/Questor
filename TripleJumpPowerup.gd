extends StaticBody2D

signal TripleJumpPower

func _on_Area2D_body_entered(body):
	if body is Player:
		emit_signal("TripleJumpPower")
		$Area2D/AudioStreamPlayer.play()
		queue_free()
		
