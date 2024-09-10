extends Node2D

@onready var storm = $"../Camera/Storm"
@onready var camera = $"../Camera"
@export var prefab: PackedScene
@export var variation: Vector2
@export var time: float
var timer: float
var offset: float

func _ready():
	offset = position.x

func spawn():
	position.x = camera.position.x + offset
	position.y = randf_range(variation.x, variation.y) + camera.position.y
	var cloud = prefab.instantiate()
	var color = 1 - storm.color.a / 2
	cloud.modulate = Color(color, color, color, .75)
	cloud.position = global_position
	add_sibling(cloud)

func _process(delta):
	timer += delta
	if timer >= time:
		spawn()
		timer = 0
