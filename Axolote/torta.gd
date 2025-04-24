extends Area2D

signal recolectado

func _on_body_entered(body):
	if body.name == "Jugador":
		emit_signal("recolectado")
		_mover_a_posicion_random()

func _mover_a_posicion_random():
	var nueva_pos = Vector2(
		randf_range(50, 670), # límites X del área visible
		randf_range(50, 1230) # límites Y del área visible
	)
	position = nueva_pos


func _on_recolectado() -> void:
	pass # Replace with function body.
