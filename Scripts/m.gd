extends Node2D

var Jugador1Puntos:int = 0
var Jugador2Puntos:int = 0
var Indice_colores:float = 0
var velocidad:float = 10.0
var op1: String
var op2: String
@onready var PuntosJugador:Label = $"Puntos jugador"
@onready var PuntosCPU:Label = $"Puntos cpu"
@onready var piedra:Sprite2D = $"Piedra2"
@onready var papel:Sprite2D = $"Papel2"
@onready var tijera:Sprite2D = $"Tijera2"
var J1 = load(Global.Personaje1)
var J2 = load(Global.Personaje2)
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
			
func OcultarElementosJugador1() -> void:
	$"Piedra3".hide()
	$"Papel3".hide()
	$"Tijera3".hide()
	$"Ganastes".hide()
	$"Empate2".hide()
	
func OcultarElementosJugador2() -> void:
	piedra.hide()
	papel.hide()
	tijera.hide()
	$"Gano".hide()
	$"Empate".hide()

func OcultarBotones() -> void:
	$"Contenedor Objetos".hide()
	
	# Función permite instanciar personaje 1
func Jugandor1() -> void:
	var a = J1.instantiate()
	self.add_child(a)
	a.position.x = 250
	a.position.y = 500
	# Get_child devuelte un array para recorrer el nodo padre. Permite acceder
	# a las propiedades de un nodo.
	a.get_child(0, false).flip_h = true
	
	# Voltea las imagenes según el panorama
	if Global.Personaje1 == "res://Escenas/j.tscn":
		a.get_child(0, false).flip_h = false
		
	elif Global.Personaje1 == "res://Escenas/phember.tscn":
		a.get_child(0, false).flip_h = true
	
	elif Global.Personaje1 == "res://Escenas/samantha.tscn":
		a.get_child(0, false).flip_h = true
	
	elif Global.Personaje1 == "res://Escenas/eli.tscn":
		a.get_child(0, false).flip_h = false
	# Función permite instanciar personaje 2
func jugador2() -> void:
	
	var b = J2.instantiate()
	self.add_child(b)
	b.position.x = 900
	b.position.y = 500	
	
	# Voltea las imagenes según el panorama
	if Global.Personaje2 == "res://Escenas/j.tscn":
		b.get_child(0, false).flip_h = true
		
	elif Global.Personaje2 == "res://Escenas/phember.tscn":
		b.get_child(0, false).flip_h = false
		
	elif Global.Personaje2 == "res://Escenas/eli.tscn":
		b.get_child(0, false).flip_h = true
func InstanciarEscenario() -> void:
	var c = Escenario.instantiate()
	# Add_child se agrega como nodo hijo a un nodo padre
	self.add_child(c, false, 1)	

func _ready():
	Jugandor1()
	jugador2()
	InstanciarEscenario()
func PuntosPantalla() -> void:
	
	PuntosJugador.text = str(Jugador1Puntos)
	PuntosCPU.text= str(Jugador2Puntos)
	
func juego(opcionJ1: String, opcionJ2: String) -> void:
	
	# jugador 2
	if 	opcionJ2 == "piedra" and opcionJ1 == "tijera":
		$"Gano".show()
		piedra.show()
		$Tijera3.show()
		Jugador2Puntos += 1
		PuntosPantalla()
		
	elif opcionJ2 == "papel" and opcionJ1 == "piedra":
		$"Gano".show()
		papel.show()
		$Piedra3.show()
		Jugador2Puntos += 1
		PuntosPantalla()
		
	elif opcionJ2 == "tijera" and opcionJ1 == "papel":
		$"Gano".show()
		tijera.show()
		$Papel3.show()
		Jugador2Puntos += 1
		PuntosPantalla()
		
	# jugador 1
	elif opcionJ2 == "tijera" and opcionJ1 == "piedra": 
		$"Ganastes".show()
		tijera.show()
		$Piedra3.show()
		Jugador1Puntos += 1
		PuntosPantalla()
		
	elif opcionJ2 == "piedra" and opcionJ1 == "papel":
		$"Ganastes".show()
		piedra.show()
		$Papel3.show()
		Jugador1Puntos += 1
		PuntosPantalla()
	
	elif opcionJ2 == "papel" and opcionJ1 == "tijera":
		$"Ganastes".show()
		papel.show()
		$Tijera3.show()
		Jugador1Puntos += 1
		PuntosPantalla()
	
	else:
		if opcionJ2 == "piedra" and opcionJ1 == "piedra":
			$"Empate".show()
			$"Empate2".show()
			piedra.show()
			$Piedra3.show()
		elif opcionJ2 == "tijera" and opcionJ1 == "tijera":
			$"Empate".show()
			$"Empate2".show()
			tijera.show()
			$Tijera3.show()
		elif opcionJ2 == "papel" and opcionJ1 == "papel":
			$"Empate".show()
			$"Empate2".show()
			papel.show()
			$Papel3.show()
		else:
			$"ColorRect".show()
			$"Activar objetos".hide()
			$"Activar objetos 2".hide()
			$"Contenedor Objetos".hide()
			$"Contenido Objetos 2".hide()
func _physics_process(delta):
	Ganador(Global.Victorias, Jugador1Puntos, Jugador2Puntos)
	
func _process(delta):
	Colores()
	
func _on_piedra_pressed():
	$"Activar objetos".hide()
	$"Contenedor Objetos".hide()
	op1 = "piedra"
	$L.show()
	Global.SoundBoton()      
	
func _on_papel_pressed():
	$"Activar objetos".hide()
	$"Contenedor Objetos".hide()
	op1 = "papel"
	$L.show()
	Global.SoundBoton()     
func _on_tijera_pressed():
	$"Activar objetos".hide()
	$"Contenedor Objetos".hide()
	op1 = "tijera"
	$L.show()
	Global.SoundBoton()      
	
func _on_boton_reinicio_pressed():
	$"Contenedor Objetos".hide()
	$"Activar objetos".show()
	$"Activar objetos 2".show()
	OcultarElementosJugador2()
	OcultarElementosJugador1()	
	$"Boton Reinicio".hide()
	$"Fondo marcador".hide()
	$Listo.show()
	Global.SoundBoton()      
	
func _on_activar_objetos_pressed():
	$"Contenedor Objetos".show()
	$"Activar objetos".hide()
	Global.SoundBoton()     
	
func _on_cerrar_pressed():
	$"Contenedor Objetos".hide()
	$"Activar objetos".show()
	Global.SoundBoton()      

func _on_activar_objetos_2_pressed():
	$"Contenido Objetos 2".show()
	$"Activar objetos 2".hide()
	Global.SoundBoton()      

func _on_cerrar_2_pressed():
	$"Contenido Objetos 2".hide()
	$"Activar objetos 2".show()
	Global.SoundBoton()      


func _on_piedra_1_pressed():
	$"Activar objetos 2".hide()
	$"Contenido Objetos 2".hide()
	op2 = "piedra"
	$l2.show()
	Global.SoundBoton()      
func _on_papel_1_pressed():
	$"Activar objetos 2".hide()
	$"Contenido Objetos 2".hide()
	op2 = "papel"
	$l2.show()
	Global.SoundBoton()      
func _on_tijera_1_pressed():
	$"Activar objetos 2".hide()
	$"Contenido Objetos 2".hide()
	op2 = "tijera"
	$l2.show()
	Global.SoundBoton()
func _on_listo_pressed():
	juego(op1, op2)
	$"Boton Reinicio".show()
	OcultarBotones()
	$"Fondo marcador".show()
	$Listo.hide()
	Global.SoundBoton()      
	op1 = ""
	op2 = ""
	$l2.hide()
	$L.hide()
	$"Activar objetos 2".hide()
	$"Contenedor Objetos".hide()

func _on_boton_menu_pressed():
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
	Global.SoundBoton()


func _on_texture_button_pressed():
	$ColorRect.hide()
	$"Contenedor Objetos".hide()
	$"Activar objetos".show()
	$"Activar objetos 2".show()
	OcultarElementosJugador2()
	OcultarElementosJugador1()	
	$"Boton Reinicio".hide()
	$"Fondo marcador".hide()
	$Listo.show()
	Global.SoundBoton()   
