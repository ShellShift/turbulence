extends CanvasLayer

@onready var animation = $AnimationPlayer

func reload():
	animation.play("slide_in")
	await animation.animation_finished
	get_tree().reload_current_scene()
	animation.play("slide_out")

func load_scene(path):
	animation.play("slide_in")
	await animation.animation_finished
	var packed = load("res://scenes/%s.tscn" % path)
	get_tree().change_scene_to_packed(packed)
	animation.play("slide_out")
