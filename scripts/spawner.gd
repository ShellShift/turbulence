extends Node2D

@onready var plane = $"../Plane"
@export var prefabs: Array[PackedScene]
@export var offset: Vector2
@export var time: float
@export var time_decrease: float
@export var min_time: float
@export var min: Vector2
@export var max: Vector2
var start_time: float
var timer: float
var prefab: int

func _ready():
	start_time = time

func spawn():
	var object = prefabs[prefab].instantiate()
	var random = Vector2(randf_range(min.x, max.x), randf_range(min.y, max.y))
	object.position = plane.position + offset.rotated(plane.velocity.angle()) + random
	add_sibling(object)

func _process(delta):
	timer += delta
	if timer >= time:
		timer = 0
		time -= time_decrease
		time = clamp(time, min_time, INF)
		if time <= start_time * .5:
			prefab = 1
		spawn()
