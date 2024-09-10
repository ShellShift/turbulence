extends Node2D

@onready var plane = $Plane
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var hiscore_label = $CanvasLayer/HiscoreLabel
var score: int
var hiscore: int
var game_started: bool

func _ready():
	get_tree().paused = true
	if FileAccess.file_exists("user://hiscore"):
		var file = FileAccess.open("user://hiscore", FileAccess.READ)
		hiscore = int(file.get_as_text())
		file.close()
	hiscore_label.text = "hiscore: %d" % hiscore
	Audio.play_music("game")

func _process(_delta):
	if Input.is_action_just_pressed("fly") && !game_started:
		get_tree().paused = false
		game_started = true
		$CanvasLayer/Title.queue_free()
	if plane.dead: return
	score = plane.position.x * .01
	score_label.text = "Score: %d" % score
	if score > hiscore:
		hiscore = score

func lose():
	var file = FileAccess.open("user://hiscore", FileAccess.WRITE)
	file.store_string(str(hiscore))
	file.close()
