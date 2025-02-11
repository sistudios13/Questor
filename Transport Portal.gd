extends Area2D



func _on_Transport_Portal_body_entered(body):
	if body is Player:
		$AudioStreamPlayer.play()
