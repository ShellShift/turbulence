extends Node2D

@onready var plane = $Plane
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var hiscore_label = $CanvasLayer/HiscoreLabel
var score: int
var hiscore: int

func _ready():
	if FileAccess.file_exists("user://hiscore"):
		var file = FileAccess.open("user://hiscore", FileAccess.READ)
		hiscore = int(file.get_as_text())
		file.close()
	hiscore_label.text = "hiscore: %d" % hiscore

func _process(delta):
	if plane.dead: return
	score = plane.position.x * .01
	score_label.text = "Score: %d" % score
	if score > hiscore:
		hiscore = score

func lose():
	hiscore_label.text = "hiscore: %d" % hiscore
	var file = FileAccess.open("user://hiscore", FileAccess.WRITE)
	file.store_string(str(hiscore))
	file.close()
