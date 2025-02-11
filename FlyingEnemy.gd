extends Area2D


func _ready():
	$AnimationPlayer.play("default")



func _on_FlyingEnemy_area_entered(area):
	if area is Bullet:
		queue_free()

