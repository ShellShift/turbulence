extends AudioListener2D

var music_player: AudioStreamPlayer2D

func play_music(path):
	var stream = load("res://audio/%s.wav" % path)
	var player = AudioStreamPlayer2D.new()
	player.stream = stream
	player.bus = "Music"
	add_child(player)
	if music_player: music_player.queue_free()
	music_player = player
	player.play()

func play(path, random_pitch = true):
	var stream = load("res://audio/%s.wav" % path)
	var player = AudioStreamPlayer2D.new()
	player.stream = stream
	if random_pitch: player.pitch_scale = randf_range(1, 2)
	player.bus = "SFX"
	add_child(player)
	player.play()
	await player.finished
	player.queue_free()
