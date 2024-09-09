extends Area2D

func _on_body_entered(body):
	body.input_active = false
	queue_free()

func _on_screen_exited():
	queue_free()
