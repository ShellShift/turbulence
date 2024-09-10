class_name LoseMenu extends Panel

func activate():
	if visible: return
	$"../..".lose()
	$AnimationPlayer.play("slide")

func restart():
	Scenes.reload()

func quit():
	Scenes.load_scene("menus")
