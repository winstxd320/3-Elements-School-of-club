extends Node2D

var tiempo:int = 0
var TiempoCambio:int = 0
func _process(delta):
	TiempoCambio += 1
	tiempo += 1
	if tiempo > 10:
		$ColorRect.hide()
	if tiempo > 20: 
		$ColorRect.show()
		tiempo = 0
	
	if TiempoCambio > 100:
		get_tree().change_scene_to_file("res://Escenas/seleccionar_escenario.tscn")
	print(tiempo)
