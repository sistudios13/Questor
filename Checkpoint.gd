extends Area2D
class_name Checkpoint

onready var checkpoint_pos = self.position
onready var animatedSprite: = $AnimatedSprite

func _on_Checkpoint_body_entered(body):
	if body is Player:
		$AudioStreamPlayer.play()
		Global.update_spawn(self.global_position)
	if not body is Player: return
	animatedSprite.play("Checked")
	
	
	
