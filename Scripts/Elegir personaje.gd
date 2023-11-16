extends Node2D
var parpadeo = load("res://Escenas/parpadeo.tscn")
var sonido = AudioStreamPlayer.new()
var jugadorCPU = [
	"res://Escenas/max.tscn",
	"res://Escenas/eli.tscn",
	"res://Escenas/j.tscn", 
	"res://Escenas/phember.tscn",
	"res://Escenas/samantha.tscn",
	"res://Escenas/cris.tscn"
	]
	
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

# Función permite cambiar de personaje por escena
func CambiarPersonajeCPU() -> void:
	rng.randomize()
	var a = jugadorCPU[rng.randi() % jugadorCPU.size()]
	Global.PersonajeCPU = a
	
func _on_juan_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje = Max
	CambiarPersonajeCPU()
	Global.Zona = "res://Escenas/juego_contra_cpu.tscn"

	
		
func _on_eli_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje = Eli
	CambiarPersonajeCPU()
	Global.Zona = "res://Escenas/juego_contra_cpu.tscn"
	
	
func _on_j_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje = J
	CambiarPersonajeCPU()
	Global.Zona = "res://Escenas/juego_contra_cpu.tscn"


func _on_texture_button_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje = Phember
	CambiarPersonajeCPU()
	Global.Zona = "res://Escenas/juego_contra_cpu.tscn"
	


func _on_samantha_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje = Samantha
	CambiarPersonajeCPU()
	Global.Zona = "res://Escenas/juego_contra_cpu.tscn"
	


func _on_cris_pressed():
	Sonido()
	EfectoTransicion()
	Global.Personaje = Cris
	CambiarPersonajeCPU()
	Global.Zona = "res://Escenas/juego_contra_cpu.tscn"
	



