extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("No Ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$SpriteANT.move_local_x(1)
	pass



func _on_ButtonMoverX_pressed():
	$SpriteANT.move_local_x(20)


func _on_ButtonDiminuir_pressed():
	$SpriteANT.scale.x *= 0.9
	$SpriteANT.scale.y *= 0.9
