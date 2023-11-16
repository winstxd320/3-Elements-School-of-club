extends Node2D


func _on_8_bits_pressed():
	Global.PlaySonido("res://Sonidos/8-bit-dream-land.mp3")
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")

func _on_tapped_pressed():
	Global.PlaySonido("res://Sonidos/trapped-in-the-box-quarantine-dance-instrumental-confinement.mp3")
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")

func _on_a_hero_pressed():
	Global.PlaySonido("res://Sonidos/kim-lightyear-legends.mp3")
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")

func _on_mudo_pressed():
	Global.SoundBoton()     
	Global.Mute()


func _on_play_pressed():
	Global.SoundBoton()     
	Global.Play()


func _on_salir_pressed():
	Global.SonidoBoton
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
