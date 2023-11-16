extends Node2D


	
var Max: String = "res://Escenas/max.tscn"
var Eli: String = "res://Escenas/eli.tscn"
var J: String  = "res://Escenas/j.tscn"
var Phember: String = "res://Escenas/phember.tscn"
var Samantha: String = "res://Escenas/samantha.tscn"
var Cris: String =  "res://Escenas/cris.tscn"
var rng:RandomNumberGenerator = RandomNumberGenerator.new()


	
func _on_juan_pressed():
	Global.Personaje1 = Max
	Global.Zona = "res://Escenas/Multijugador.tscn"
	# Cambia a la escena de escojer segundo jugador
	get_tree().change_scene_to_file("res://Escenas/elegir_personaje_jugdor2.tscn")
		
func _on_eli_pressed():
	Global.Personaje1 = Eli
	Global.Zona = "res://Escenas/Multijugador.tscn"
	get_tree().change_scene_to_file("res://Escenas/elegir_personaje_jugdor2.tscn")
	
func _on_j_pressed():
	Global.Personaje1 = J
	Global.Zona = "res://Escenas/Multijugador.tscn"
	get_tree().change_scene_to_file("res://Escenas/elegir_personaje_jugdor2.tscn")

func _on_texture_button_pressed():
	Global.Personaje1 = Phember
	Global.Zona = "res://Escenas/Multijugador.tscn"
	get_tree().change_scene_to_file("res://Escenas/elegir_personaje_jugdor2.tscn")


func _on_samantha_pressed():
	Global.Personaje1 = Samantha
	Global.Zona = "res://Escenas/Multijugador.tscn"
	
	get_tree().change_scene_to_file("res://Escenas/elegir_personaje_jugdor2.tscn")


func _on_cris_pressed():
	Global.Personaje1 = Cris
	Global.Zona = "res://Escenas/Multijugador.tscn"
	get_tree().change_scene_to_file("res://Escenas/elegir_personaje_jugdor2.tscn")



