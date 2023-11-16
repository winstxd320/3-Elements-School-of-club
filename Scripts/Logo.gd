extends CharacterBody2D

func _physics_process(delta):
	var vel_rotacion = 3
	rotate(vel_rotacion * delta)
	
	
