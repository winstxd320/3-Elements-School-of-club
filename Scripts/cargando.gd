extends Node2D
var tiempo:int = 0
var TiempoCambio:int = 0

func _ready():
	var sonido = AudioStreamPlayer.new()
	sonido.stream = preload("res://Sonidos/aplausos.wav")
	add_child(sonido)
	sonido.play()
	sonido.bus = "Master"
	sonido.volume_db = 15
func _process(delta):
	TiempoCambio += 1
	if TiempoCambio > 500:
		get_tree().change_scene_to_file(Global.Zona)
	$"Icon".rotate(5 * delta)
