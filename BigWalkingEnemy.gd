extends KinematicBody2D

var health = 2

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var ledgeCheckRight: = $LedgeCheckRight
onready var ledgeCheckLeft: = $LedgeCheckLeft
onready var sprite: = $AnimatedSprite



func _physics_process(delta):
	if health == 1:
		sprite.animation = "CrackedWalking"
	if health == 2:
		sprite.animation = "Walking"
	if health == 0:
		queue_free()
	var found_wall = is_on_wall()
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
		
	sprite.flip_h = direction.x > 0
	
	velocity = direction * 50
	move_and_slide(velocity)
	if health == 1:
		sprite.animation = "CrackedWalking"
	if health == 2:
		sprite.animation = "Walking"
	if health == 0:
		queue_free()

func _on_BulletCheck_area_entered(area):
	if area is Bullet:
		health -= 1
