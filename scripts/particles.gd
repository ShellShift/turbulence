extends Node2D

func spawn(path, parent, follow = true):
	var particle = load("res://prefabs/particles/%s.tscn" % path).instantiate()
	if follow:
		parent.add_child(particle)
	else:
		particle.position = parent.global_position
		particle.rotation = parent.global_rotation
		get_tree().current_scene.add_child(particle)
	particle.emitting = true
	await particle.finished
	particle.queue_free()
