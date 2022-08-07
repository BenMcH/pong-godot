extends KinematicBody2D

const default_movement_speed = 500
var movement_speed = 0
var velocity = Vector2.ZERO

func _ready():
	start_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity * movement_speed * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		velocity *= 1.05

func stop_ball():
	movement_speed = 0

func start_ball():
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = rand_range(-1, 1)
	movement_speed = default_movement_speed
