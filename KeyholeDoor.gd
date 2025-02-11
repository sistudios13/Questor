extends Area2D




func _on_KeyholeDoor_body_entered(body):
	if body is Player and Global.key_collected:
		$AnimatedSprite.play("Opening")
		yield(get_tree().create_timer(2), "timeout")
		$StaticBody2D/CollisionShape2D.disabled = true


func _on_AnimatedSprite_animation_finished():
	queue_free()
