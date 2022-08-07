extends Node2D

var movement_speed = 500
export(String) var action

func _physics_process(delta):
	var movement = movement_speed
	if Input.is_action_pressed(action):
		movement = -movement
	$PhysicsBody.move_and_collide(Vector2(0, movement) * delta)
