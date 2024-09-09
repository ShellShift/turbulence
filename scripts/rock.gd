extends Area2D

@export var particle: String

func _ready():
	rotation = randf_range(-TAU, TAU)

func _on_body_entered(body):
	body.input_active = false
	queue_free()
	Camera.shake()
	Particles.spawn(particle, self, false)
	if !$"../CanvasLayer/LoseMenu".visible:
		$"../CanvasLayer/LoseMenu/AnimationPlayer".play("slide")

func _on_screen_exited():
	queue_free()
