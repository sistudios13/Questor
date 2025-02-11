extends Node

var first_portal_destination = Vector2(10233, -1332)

var count = 0

var last_count = count

var time = 0

var score = 0

var end_count = 0

var end_time = 0

var end_score = 0

var key_collected = false

var spawn_point = Vector2(4, -15)# (4, -15)

func update_spawn(new_point):
	spawn_point = new_point

var shoot_direction = 1

var rock_count = 10 # the same

var original_rock_count = 10 # the same

var player_sprite = "blue"
