extends Area2D

signal KeyCollected

func _on_Key_body_entered(body):
	if body is Player:
		Global.key_collected = true
		emit_signal("KeyCollected")
		$AudioStreamPlayer.play()
		queue_free()
