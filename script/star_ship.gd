extends Area2D
class_name star_ship


# Variables asosiadas al singleton 
var velocidad_inicial = Global.velocidad_inicial
var velocidad_maxima = Global.velocidad_maxima
var aceleracion = Global.aceleracion       # velocidad por segundo al acelerar
var desaceleracion = Global.aceleracion# velocidad por segundo al soltar el botón
var velocidad_actual = Global.velocidad_actual
var angular_speed: float = Global.angular_speed * 1.5
var life: int = Global.life

#Disparos
@export var bullet_scene: PackedScene


#Control de vida

# Declaración de una función sin parámetros
func life_points():
	if life == 0:
		queue_free()

func _process(delta):
	
	life_points()
	#Controlando la direccion de la nave
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
		$CanvasGroup/CPUParticles2D.emitting = true
		
	else :
		$CanvasGroup/CPUParticles2D.emitting = false

	position += velocity * delta

func fire_bullet():
	var bullet_instance = bullet_scene.instantiate()
	get_parent().add_child(bullet_instance)
	
	
	#Controlando posicion
	bullet_instance.global_position = $Marker2D.global_position


func _on_area_entered(area: asteroid) -> void:
	life -= 1
	Global.life = life
	if life < 0:
		life = 0
	print(life)
	pass # Replace with function body.
	
	


func _on_fire_zone_area_entered(area: asteroid) -> void:
	fire_bullet()
	print("fire")
	pass # Replace with function body.
	



func _on_fire_zone_area_exited(area: asteroid) -> void:
	print("not fire")
	pass # Replace with function body.
