extends Node2D


# Declare member variables here. Examples:
var x = 1
var d = 0
var novoIcone 
var iconeBase
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	iconeBase = load("res://icon.png")
	novoIcone = load("res://pop.jpg")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.move_local_x(x)
	d += 1
	if (d%7)==0:
		$Sprite.texture = novoIcone
	else:
		$Sprite.texture = iconeBase
		
	if d > 500:
		$Sprite.move_local_x(-1 * d)
		d = 0
