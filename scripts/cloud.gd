extends Sprite2D

func _ready():
	frame = randi() % hframes

func _on_screen_exited():
	queue_free()
