extends CharacterBody2D


var speed = Global.speed
var angular_speed = Global.angular_speed * 1.5


func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1

	rotation += angular_speed * direction * delta

	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("fiun")
		velocity = Vector2.UP.rotated(rotation) * speed
	else :
		$AnimatedSprite2D.play("statik")
	position += velocity * delta
