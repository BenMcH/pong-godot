extends KinematicBody2D

const ai_update_freq = 0.25;

var movement_speed = 500
var ai_pressed = false
var ai_last_update = 0
export(String) var action

var ball: KinematicBody2D

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(delta):
	var movement = movement_speed
	if !action:
		ai_last_update += delta
		if ai_last_update > ai_update_freq:
			ai_pressed = should_rise_ai()
			ai_last_update = 0
		if ai_pressed:
			movement = -movement
	elif Input.is_action_pressed(action):
		movement = -movement
	move_and_slide(Vector2(0, movement))

func should_rise_ai():
	return position.y - ball.position.y > 50
