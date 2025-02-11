extends Area2D

class_name Bullet

func _physics_process(delta):
	position.x += Global.shoot_direction

func _process(delta):
	position.y -= 0.2
	yield(get_tree().create_timer(0.0005), "timeout")
	
	var colliderLeft = $RayCast2D.get_collider()
	var colliderRight = $RayCast2D2.get_collider()
	if colliderLeft is wall:
		queue_free()
	if colliderRight is wall:
		queue_free()
	


func _on_Area2D_body_entered(body):
	if body is wall:
		queue_free()

func _ready():
	$AnimationPlayer.play("spin")
	yield(get_tree().create_timer(0.35), "timeout")
	yield(get_tree().create_timer(0.35), "timeout")
	queue_free()
