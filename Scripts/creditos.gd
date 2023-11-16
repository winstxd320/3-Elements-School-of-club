extends Node2D



func _on_menu_pressed():
	Global.SoundBoton()     
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
