class_name LoseMenu extends Panel

func restart():
	Scenes.reload()

func quit():
	Scenes.load_scene("menus")
