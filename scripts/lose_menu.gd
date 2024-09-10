class_name LoseMenu extends Panel

func activate():
	if visible: return
	$"../..".lose()
	$AnimationPlayer.play("slide")
	Audio.play("click")

func restart():
	Audio.play("click")
	Scenes.reload()

func quit():
	Audio.play("click")
	Scenes.load_scene("menus")
