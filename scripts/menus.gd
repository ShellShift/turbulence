extends Control

@export var time: float
@export var active: Control

func _ready():
	Audio.play_music("menu")

func play():
	Audio.play("click")
	Scenes.load_scene("game")

func quit():
	Audio.play("click")
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
	Audio.play("click")
	await tween.finished
	prev_active.hide()

func icon_hover():
	var icon = $Main/Icon
	var tween = create_tween()
	tween.tween_property(icon, "rotation", 0, time)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)

func icon_unhover():
	var icon = $Main/Icon
	var tween = create_tween()
	tween.tween_property(icon, "rotation", deg_to_rad(-25), time)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN_OUT)
