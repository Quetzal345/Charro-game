extends Area2D

const VELOCIDAD = 100
var direccion = Vector2.ZERO

@onready var timer = $Timer  # En lugar de $CambioDireccion


func _ready():
	cambiar_direccion()
	cambio_timer.start()

func _process(delta):
	position += direccion * VELOCIDAD * delta

func cambiar_direccion():
	var angulo = randf_range(0, TAU)
	direccion = Vector2(cos(angulo), sin(angulo)).normalized()

func _on_CambioDireccion_timeout():
	cambiar_direccion()

func _on_body_entered(body):
	if body.name == "Jugador":
		body.recibir_dano()
