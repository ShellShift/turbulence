extends Control

@export var time: float
@export var active: Control

func play():
	Scenes.load_scene("game")

func quit():
	get_tree().quit()

func enable(path):
	var control = get_node(path)
	control.modulate = Color.TRANSPARENT
	control.show()
	var tween = create_tween()
	tween.tween_property(active, "modulate", Color.TRANSPARENT, time)
	tween.tween_property(control, "modulate", Color.WHITE, time)
	var prev_active = active
	active = control
	await tween.finished
	prev_active.hide()

func icon_hover():
	$Main/Icon.rotation += 6.16

func icon_unhover():
	$Main/Icon.rotation -= 6.16
