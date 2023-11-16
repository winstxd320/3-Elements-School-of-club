extends Node2D

var velocidad: float = 5.0

func _physics_process(delta):
	
	$Logo.move_local_x(velocidad, false)
	if $Logo.position.x > 1100:
		velocidad = 0.0
		$"Jugar".show()
		$"2 jugadores".show()
		$Sonido.show()
		$creditos.show()
		$"Label".show()
func _on_jugar_pressed():
	Global.Victorias = 5
	Global.SoundBoton()
	Global.AA = "res://Escenas/elegir_personaje.tscn"
	get_tree().change_scene_to_file("res://Escenas/configuracion.tscn")
	
func _on_sonido_pressed():
	Global.SoundBoton()
	get_tree().change_scene_to_file("res://Escenas/sonido.tscn")

func _on_2_jugadores_pressed():
	Global.SoundBoton()      
	Global.Victorias = 5
	Global.AA = "res://Escenas/elegir_personaje_jugdor1.tscn"
	get_tree().change_scene_to_file("res://Escenas/configuracion.tscn")


func _on_creditos_pressed():
	Global.SoundBoton()     
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")
