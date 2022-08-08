extends Node2D

func _on_SinglePlayer_pressed():
	Settings.single_player = true	
	get_tree().change_scene("res://Board/Board.tscn")


func _on_TwoPlayer_pressed():
	Settings.single_player = false
	get_tree().change_scene("res://Board/Board.tscn")
