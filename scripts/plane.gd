extends CharacterBody2D

@export var speed: float
@export var increase_speed: float
@export var max_speed: float
@export var velocity_clamp: Vector2
@export var fly_velocity: float
@export var increase_fly: float
@export var max_fly: float
@export var fuel_speed: float
@export var fuel_decrease_speed: float
@export var max_fuel: float
var fuel: float
var input_active: bool = true

func _ready():
	fuel = max_fuel

const gravity = 12.25
func _physics_process(delta):
	speed += delta * increase_speed
	speed = clamp(speed, 0, max_speed)
	fly_velocity += delta * increase_fly
	fly_velocity = clamp(fly_velocity, 0, max_fly)
	velocity.x = speed
	if Input.is_action_pressed("fly") && input_active:
		if fuel > 0:
			velocity.y -= fly_velocity
			fuel -= delta * fuel_decrease_speed
	else: fuel = clamp(fuel + delta * fuel_speed, 0, max_fuel)
	velocity.y += gravity
	velocity.y = clamp(velocity.y, velocity_clamp.x, velocity_clamp.y)
	look_at(position + velocity)
	move_and_slide()