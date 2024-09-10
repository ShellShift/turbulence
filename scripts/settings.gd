class_name Settings extends Control

static var data

func _ready():
	if FileAccess.file_exists("user://settings"):
		var file = FileAccess.open("user://settings", FileAccess.READ)
		data = JSON.parse_string(file.get_as_text())
		file.close()
	else: data = {
		"music": 0,
		"sfx": 0,
		"fullscreen": false,
		"camera_shake": true
	}
	$Music.value = data.music
	$SoundEffects.value = data.sfx
	$FullScreen.button_pressed = data.fullscreen
	$CameraShake.button_pressed = data.camera_shake
	if data.fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), data.music)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), data.sfx)

func save():
	var file = FileAccess.open("user://settings", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func _on_music_value_changed(value):
	data.music = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), data.music)

func _on_music_drag_ended(_value_changed):
	save()

func _on_sound_effects_value_changed(value):
	data.sfx = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), data.sfx)
	save()

func _on_full_screen_toggled(toggled_on):
	data.fullscreen = toggled_on
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	save()

func _on_camera_shake_toggled(toggled_on):
	data.camera_shake = toggled_on
	save()
