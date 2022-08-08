extends Node

var playerOneScore: int = 0
var playerTwoScore: int = 0

func _ready():
	randomize()
	if Settings.single_player:
		$Player2.action = ""
	else:
		$Player2.action = "move_up_player_2"
		
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene("res://MainMenu/MainMenu.tscn")

func reset_ball():
	$Ball.position = Vector2(640, 360)
	get_tree().call_group("BallGroup", "stop_ball")
	$BallStartTimer.start()

func _on_LeftWall_body_entered(body):
	reset_ball()
	playerOneScore += 1
	$Player1Score.text = str(playerOneScore)

func _on_RightWall_body_entered(body):
	reset_ball()
	playerTwoScore += 1
	$Player2Score.text = str(playerTwoScore)

func _on_BallStartTimer_timeout():
	get_tree().call_group("BallGroup", "start_ball")
