extends Camera2D

@export var target: CharacterBody2D
@export var off: float

func _process(_delta):
	position = target.position + Vector2(off, 0)
