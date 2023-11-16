extends Node2D
@onready var PosicionJugador = $"Posicion"
var Jugador: Node2D = null

func _ready():
	Jugador = load(Global.Personaje).instance()
	
