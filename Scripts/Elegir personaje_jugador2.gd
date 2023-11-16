extends Node2D

var parpadeo = load("res://Escenas/parpadeo.tscn")
var sonido = AudioStreamPlayer.new()
var Max: String = "res://Escenas/max.tscn"
var Eli: String = "res://Escenas/eli.tscn"
var J: String  = "res://Escenas/j.tscn"
var Phember: String = "res://Escenas/phember.tscn"
var Samantha: String = "res://Escenas/samantha.tscn"
var Cris: String =  "res://Escenas/cris.tscn"
var rng:RandomNumberGenerator = RandomNumberGenerator.new()

func EfectoTransicion() -> void:
	var a = parpadeo.instantiate()
	self.add_child(a, false, 0)
	
func Sonido() -> void:
	add_child(sonido)
	sonido.stream = preload("res://Sonidos/sonido Seleccionar personaje.wav")
	sonido.volume_db = 15
	sonido.bus = "Master"
	sonido.play()
	
	
func _on_juan_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje2 = Max
	Global.Zona = "res://Escenas/Multijugador.tscn"
	
func _on_eli_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje2 = Eli
	Global.Zona = "res://Escenas/Multijugador.tscn"
	
	
func _on_j_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje2 = J
	Global.Zona = "res://Escenas/Multijugador.tscn"
	

func _on_texture_button_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje2 = Phember
	Global.Zona = "res://Escenas/Multijugador.tscn"
	


func _on_samantha_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje2 = Samantha
	Global.Zona = "res://Escenas/Multijugador.tscn"
	


func _on_cris_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje2 = Cris
	Global.Zona = "res://Escenas/Multijugador.tscn"
	



