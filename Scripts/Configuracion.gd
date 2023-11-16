extends Node2D


func NumVictorias(CantVictorias:int) -> void:
	if int($Entrada.text) > 0 and int($Entrada.text) <= 15:
		get_tree().change_scene_to_file(Global.AA)
	else:
		$Error.show()
func _on_jugar_pressed():
	Global.SoundBoton()
	Global.Victorias = int($Entrada.text)
	NumVictorias(Global.Victorias)

func _on_x_pressed():
	$Error.hide()
