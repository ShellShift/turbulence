extends LoseMenu

@onready var animation = $AnimationPlayer

func toggle_pause():
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		animation.play("slide")
	else:
		animation.play("slide_out")

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
