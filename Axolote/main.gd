extends Node2D

@onready var contador_label = $CanvasLayer/ContadorLabel
@onready var jugador = $Jugador
@onready var tamal = $Tamal1

var tamales_recolectados := 0
const TOTAL_TAMALES := 20

func _ready():
	tamal.connect("recolectado", _on_tamal_recolectado)

func _on_tamal_recolectado():
	tamales_recolectados += 1
	contador_label.text = "Tortas: %d/%d" % [tamales_recolectados, TOTAL_TAMALES]

	if tamales_recolectados >= TOTAL_TAMALES:
		ganar_juego()

func ganar_juego():
	# Aquí puedes mostrar un mensaje o cambiar de escena
	print("¡Ganaste el juego!")
	var popup = Label.new()
	popup.text = "¡Ganaste el juego!"
	popup.set_position(Vector2(200, 640))
	popup.set_scale(Vector2(2, 2))
	add_child(popup)

	# Opcional: detener al jugador o reiniciar
	jugador.queue_free()
	tamal.queue_free()


func _on_tamal_1_recolectado() -> void:
	pass # Replace with function body.
