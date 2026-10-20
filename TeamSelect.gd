extends Control

func _on_pirate_btn_pressed():
	Global.current_team = "Pirate"
	get_tree().change_scene_to_file("res://GameWorld.tscn")

func _on_marine_btn_pressed():
	Global.current_team = "Marine"
	get_tree().change_scene_to_file("res://GameWorld.tscn")
