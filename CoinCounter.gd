extends Label


var count = 0


func _on_Coin_body_entered(body):
	if body is Player:	
		updatescore()
		

func updatescore():
	Global.count += 1
	text = str(Global.count) 

func _on_World_tree_entered():
	count = 0
	text = str(Global.count)
