extends Node2D


# Declare member variables here. Examples:
var x = 1
var y = 1
var dy = 0
var dx = 0
var novoIcone = 0
var iconeBase = 0



# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	iconeBase = load("res://icon.png")
	novoIcone = load("res://pop.jpg")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (dx%2==0):
		$Sprite.move_local_x(x)
		
	$Sprite.move_local_y(y)
	dx += x 
	dy += y
	if ( ((dx%100)>=0) and ((dx%100)<50) )   :
		$Sprite.texture = novoIcone
	else:
		$Sprite.texture = iconeBase
	if (dy > 250):
		y = -1
	if dy <=10:
		y = 1
		
	if dx > 800 or dy > 300:
		$Sprite.move_local_x(-1 * dx/2)
		dx = 0
		dy = 0


