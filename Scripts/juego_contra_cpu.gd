extends Node2D

var JugadorPuntos:int = 0
var CPUPuntos:int = 0
var Indice_colores:float = 0
var velocidad:float = 10.0

@onready var PuntosJugador:Label = $"Puntos jugador"
@onready var PuntosCPU:Label = $"Puntos cpu"
@onready var piedra:Sprite2D = $"Piedra2"
@onready var papel:Sprite2D = $"Papel2"
@onready var tijera:Sprite2D = $"Tijera2"
var Tu = load(Global.Personaje)
var CPU = load(Global.PersonajeCPU)
var Escenario = load(Global.Escenario)

func Colores():
	
	var Colores = [ 
		Color(0, 0, 255),
		Color(255, 0, 10),
		Color(0, 150, 0),
		Color(150, 0, 0)
	]
	
	Indice_colores += 0.1
	if Indice_colores >= Colores.size():
		Indice_colores = 0
	$"Fondo marcador".color = Colores[Indice_colores]


func Ganador(Victorias:int, PuntosJugador:int, PuntosCPU:int) -> void:
	
	if PuntosJugador == Victorias:
		$"Contenedor Objetos".hide()
		$"Activar objetos".hide()
		$"Ganador animacion".move_local_x(velocidad, false)
		$"Boton Reinicio".hide()
		
		if $"Ganador animacion".position.x > 840:
			velocidad = 0.0
			$"boton menu".show()
			
	if PuntosCPU == Victorias:
		$"Contenedor Objetos".hide()
		$"Activar objetos".hide()
		$"Perdedor animacion".move_local_x(velocidad, false)
		$"Boton Reinicio".hide()
		
		if $"Perdedor animacion".position.x > 820:
			velocidad = 0.0
			$"boton menu".show()
			
func OcultarElementosJugador() -> void:
	$"Piedra3".hide()
	$"Papel3".hide()
	$"Tijera3".hide()
	$"Ganastes".hide()
	$"Empate2".hide()
	
func OcultarElementosCPU() -> void:
	piedra.hide()
	papel.hide()
	tijera.hide()
	$"Gano".hide()
	$"Empate".hide()

func OcultarBotones() -> void:
	$"Contenedor Objetos".hide()
	
	# Función permite instanciar personaje
func Jugandor() -> void:
	var a = Tu.instantiate()
	self.add_child(a)
	a.position.x = 250
	a.position.y = 500
	# Get_child devuelte un array para recorrer el nodo padre. Permite acceder
	# a las propiedades de un nodo.
	a.get_child(0, false).flip_h = true
	
	# Voltea las imagenes según el panorama
	if Global.Personaje == "res://Escenas/j.tscn":
		a.get_child(0, false).flip_h = false
		
	elif Global.Personaje == "res://Escenas/phember.tscn":
		a.get_child(0, false).flip_h = true
	
	elif Global.Personaje == "res://Escenas/samantha.tscn":
		a.get_child(0, false).flip_h = false
	
	elif Global.Personaje == "res://Escenas/eli.tscn":
		a.get_child(0, false).flip_h = false
	
	# Función permite instanciar personaje CPU
func jugadorCPU() -> void:
	
	var b = CPU.instantiate()
	self.add_child(b)
	b.position.x = 900
	b.position.y = 500	
	
	# Voltea las imagenes según el panorama
	if Global.PersonajeCPU == "res://Escenas/j.tscn":
		b.get_child(0, false).flip_h = true
		
	elif Global.PersonajeCPU == "res://Escenas/phember.tscn":
		b.get_child(0, false).flip_h = false
	
	elif Global.PersonajeCPU == "res://Escenas/eli.tscn":
		b.get_child(0, false).flip_h = true
		
func InstanciarEscenario() -> void:
	var c = Escenario.instantiate()
	# Add_child se agrega como nodo hijo a un nodo padre
	self.add_child(c, false, 1)	
func _ready():
	Jugandor()
	jugadorCPU()
	InstanciarEscenario()
func PuntosPantalla() -> void:
	
	PuntosJugador.text = str(JugadorPuntos)
	PuntosCPU.text= str(CPUPuntos)
	
func juego(opcionJ: String) -> void:
	# IA del juego
	var rng = RandomNumberGenerator.new()
	var elementos = ["piedra", "papel", "tijera"]
	var cpu = rng.randi() % 3
	
	if ("piedra" in elementos and cpu == 0) and opcionJ == "tijera":
		$"Gano".show()
		piedra.show()
		CPUPuntos += 1
		PuntosPantalla()
		
	elif ("papel" in elementos and cpu == 1) and opcionJ == "piedra":
		$"Gano".show()
		papel.show()
		CPUPuntos += 1
		PuntosPantalla()
		
	elif ("tijera" in elementos and cpu == 2) and opcionJ == "papel":
		$"Gano".show()
		tijera.show()
		CPUPuntos += 1
		PuntosPantalla()
		
	# Opciones del jugador
	elif ("tijera" in elementos and cpu == 2) and opcionJ == "piedra": 
		$"Ganastes".show()
		JugadorPuntos += 1
		tijera.show()
		PuntosPantalla()
	elif ("piedra" in elementos and cpu == 0) and opcionJ == "papel":
		$"Ganastes".show()
		JugadorPuntos += 1
		piedra.show()
		PuntosPantalla()
	
	elif ("papel" in elementos and cpu == 1) and opcionJ == "tijera":
		$"Ganastes".show()
		JugadorPuntos += 1
		papel.show()
		PuntosPantalla()
		
	else:
		if "piedra" in elementos and opcionJ == "piedra":
			$"Empate".show()
			$"Empate2".show()
			piedra.show()
		elif "tijera" in elementos and opcionJ == "tijera":
			$"Empate".show()
			$"Empate2".show()
			tijera.show()
		elif "papel" in elementos and opcionJ == "papel":
			$"Empate".show()
			$"Empate2".show()
			papel.show()
func _physics_process(delta):
	Ganador(Global.Victorias, JugadorPuntos, CPUPuntos)
	
func _process(delta):
	
	Colores()
	
func _on_piedra_pressed():
	$"Boton Reinicio".show()
	$"Piedra3".show()
	OcultarBotones()
	juego("piedra")
	$"Fondo marcador".show()
	Global.SoundBoton()      
func _on_papel_pressed():
	$"Boton Reinicio".show()
	$"Papel3".show()
	OcultarBotones()
	juego("papel")
	$"Fondo marcador".show()
	Global.SoundBoton()      
func _on_tijera_pressed():
	$"Boton Reinicio".show()
	$"Tijera3".show()
	OcultarBotones()
	juego("tijera")
	$"Fondo marcador".show()
	Global.SoundBoton()      
func _on_boton_reinicio_pressed():
	$"Contenedor Objetos".hide()
	$"Activar objetos".show()
	OcultarElementosCPU()
	OcultarElementosJugador()	
	$"Boton Reinicio".hide()
	$"Fondo marcador".hide()
	Global.SoundBoton()      

func _on_activar_objetos_pressed():
	$"Contenedor Objetos".show()
	$"Activar objetos".hide()
	Global.SoundBoton()      
func _on_cerrar_pressed():
	$"Contenedor Objetos".hide()
	$"Activar objetos".show()
	Global.SoundBoton()      


func _on_boton_reiniciar_pressed():
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
	Global.SoundBoton()
