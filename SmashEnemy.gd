extends KinematicBody2D
onready var original_x = position.x 
onready var original_y = position.y

var while_counter = true

func _ready():
	while while_counter:
		position.y += - 5 #Up
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		yield(get_tree().create_timer(0.1), "timeout")
		position.y += - 5
		$AnimatedSprite.animation = "Angry"#Down
		yield(get_tree().create_timer(1.5), "timeout")
		position.y += 20
		yield(get_tree().create_timer(0.05), "timeout")
		position.y += 20
		yield(get_tree().create_timer(0.05), "timeout")
		position.y += 20
		yield(get_tree().create_timer(0.05), "timeout")
		position.y += 30
		yield(get_tree().create_timer(0.75), "timeout")
		$AnimatedSprite.animation = "default"
		yield(get_tree().create_timer(0.75), "timeout")
		
	



