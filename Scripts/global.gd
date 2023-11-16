extends Node

var a = AudioStreamPlayer.new()
var NodoSonido = AudioStreamPlayer.new()
var SonidoBoton = AudioStreamPlayer.new()
var SonidoAplausos = AudioStreamPlayer.new()
var volumen: int = 15
var Personaje: String
var PersonajeCPU: String
var Personaje1: String
var Personaje2: String
var Victorias:int 
var Escenario: String
var Zona: String
var EscenarioParpadeo: String
var AA: String

func _ready():

	add_child(NodoSonido)
	NodoSonido.bus = "Master"
	
	a.stream = load("res://Sonidos/sonido intro.mp3")
	add_child(a)
	a.bus = "Master"
	a.play()
	
func PlaySonido(Ruta:String) -> void:
	NodoSonido.stream_paused = false
	if NodoSonido.playing or a.playing:
		NodoSonido.stop()
		a.stop()
	NodoSonido.stream = load(Ruta)
	NodoSonido.play()

func Play() -> void:
	NodoSonido.stream_paused = false
	a.stream_paused = false

func Mute() -> void:
	NodoSonido.stream_paused = true
	a.stream_paused = true

func SoundAplausos() -> void:
	add_child(SonidoAplausos)
	SonidoAplausos.volume_db = 15
	SonidoAplausos.stream = preload("res://Sonidos/aplausos.wav")
	SonidoAplausos.bus = "Master"
	SonidoAplausos.play()	


func SoundBoton() -> void:
	add_child(SonidoBoton)
	SonidoBoton.volume_db = 15
	SonidoBoton.stream = preload("res://Sonidos/sonido boton.wav")
	SonidoBoton.bus = "Master"
	SonidoBoton.play()	


	

