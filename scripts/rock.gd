extends Area2D

@export var particle: String

func _ready():
	rotation = randf_range(-TAU, TAU)

func _on_body_entered(body):
	body.dead = true
	queue_free()
	Camera.shake()
	Particles.spawn(particle, self, false)
	$"../CanvasLayer/LoseMenu".activate()

func _on_screen_exited():
	queue_free()
