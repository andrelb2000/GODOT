extends Node2D


# Declare member variables here. Examples:
var x = 1
var 
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
	$Sprite.move_local_x(x)
	dx += 1
	if ( ((dx%100)>=0) and ((dy%100)<50) )   :
		$Sprite.texture = novoIcone
	else:
		$Sprite.texture = iconeBase
		
	if dx > 500 or dy >500:
		$Sprite.move_local_x(-1 * dx)
		$Sprite.move_local_y(-1 * dy)
		d = 0
