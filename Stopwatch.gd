extends Label

var time_elapsed := 0.0

func _process(delta: float) -> void:
		time_elapsed += delta
		text = str(round(time_elapsed))
		Global.time = str(round(time_elapsed))
