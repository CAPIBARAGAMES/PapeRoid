extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bar_life()
	pass

#Contro las actualizaciones de la barra de vida
func bar_life():
	$Control/punts_life.text = "PL: " + str(Global.life)
	pass
