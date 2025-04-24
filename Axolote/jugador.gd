extends CharacterBody2D

const VELOCITY = 200
const LIMIT_LEFT = 0
const LIMIT_RIGHT = 1120
const LIMIT_TOP = 0
const LIMIT_BOTTOM = 1120

# Referencias corregidas
@onready var personaje = $Sprite2D/Personaje
@onready var timer = $Timer

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	velocity = input_vector * VELOCITY
	move_and_slide()

	# Limitar al área del fondo
	position.x = clamp(position.x, LIMIT_LEFT, LIMIT_RIGHT)
	position.y = clamp(position.y, LIMIT_TOP, LIMIT_BOTTOM)

func hacerse_gordo_temporal():
	personaje.scale = Vector2(2, 2)
	timer.start()

func _on_Timer_timeout():
	personaje.scale = Vector2(1, 1)


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_personaje_frame_changed() -> void:
	pass # Replace with function body.
