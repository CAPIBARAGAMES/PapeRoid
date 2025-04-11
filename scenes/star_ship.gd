extends CharacterBody2D

var velocidad_inicial: float = 400
var velocidad_maxima: float = 600
var aceleracion: float = 200       # velocidad por segundo al acelerar
var desaceleracion: float = 200   # velocidad por segundo al soltar el botón
var velocidad_actual: float = 0

var angular_speed: float = Global.angular_speed * 1.5

func _process(delta):
	var direction := 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		direction = 1

	rotation += angular_speed * direction * delta

	var velocity := Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		$Timer.start()
		$AnimatedSprite2D.play("fiun")
		
		# Aceleración
		velocidad_actual += aceleracion * delta
		velocidad_actual = clamp(velocidad_actual, velocidad_inicial, velocidad_maxima)
	else:
		$AnimatedSprite2D.play("statik")
		
		# Desaceleración
		velocidad_actual -= desaceleracion * delta
		velocidad_actual = max(velocidad_actual, 0)

	if velocidad_actual > 0:
		velocity = Vector2.UP.rotated(rotation) * velocidad_actual

	position += velocity * delta
