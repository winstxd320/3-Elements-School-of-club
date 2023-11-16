extends Node2D

func EfectoCargando() -> void:
	var Escena = preload("res://Escenas/cargando.tscn")
	var a = Escena.instantiate()
	self.add_child(a, false, 0)
	
func _on_1_pressed():
	EfectoCargando()
	Global.Escenario = "res://Escenas/salon_de_clases.tscn"
	
func _on_patrio_tracero_de_tarde_pressed():
	EfectoCargando()
	Global.Escenario = "res://Escenas/patio_tracero_de_tarde.tscn"
	
func _on_salon_de_matematicas_pressed():
	EfectoCargando()
	Global.Escenario = "res://Escenas/salon_de_matematicas.tscn"
	
