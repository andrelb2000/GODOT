extends Node2D


# Declare member variables here. Examples:
var x = 1
var d = 0
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.move_local_x(x)
	d += 1
	if d > 500:
		$Sprite.move_local_x(-1 * d)
		d = 0
