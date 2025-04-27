extends Area2D
class_name Bullet

@export var speed: float = 800.0
@export var damage: int = 1
var velocity:Vector2 = Vector2.ZERO




func _ready():
	pass

func _physics_process(delta):
	position += velocity * delta
