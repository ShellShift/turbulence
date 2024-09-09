class_name Camera extends Camera2D

static var instance: Camera2D
@onready var storm = $Storm
@export var target: CharacterBody2D
@export var off: float
@export var speed: float
var shake_time: float
var shake_strength: float

func _ready():
	instance = self

func _process(delta):
	position = target.position + Vector2(off, 0)
	storm.color.a += delta * speed
	storm.color.a = clamp(storm.color.a, 0, 1)
	if shake_time > 0:
		shake_time -= delta
		offset = Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
	else: offset = Vector2.ZERO

static func shake(time = 0.1, strength = 1):
	instance.shake_time = time
	instance.shake_strength = strength
