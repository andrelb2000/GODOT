extends Node2D

var correndo = 0
var velocidadeX = 0
var velocidadeY = 0
var limiteX = 1920
var limiteY = 1080
func _ready():
	randomize()
	$Rr1.position.x = 1000
	$Rr1.position.y = 500
func _process(delta):
	if correndo:
		velocidadeX = randi() % 50  - 25
		velocidadeY = randi() %  30  - 15 
	$Rr1.move_local_x(velocidadeX)
	$Rr1.move_local_y(velocidadeY)
	if 	$Rr1.position.x > limiteX or \
		$Rr1.position.x < 0 or \
		$Rr1.position.y > limiteY or \
		$Rr1.position.y < 0:
			$Rr1.position.x = 1000
			$Rr1.position.y = 500
func _on_RunButton_pressed():
	correndo = 1
	$RRAudioStreamPlayer.play()
func _on_StopButton_pressed():
	correndo = 0
	velocidadeX = 0
	velocidadeY = 0
	$RRAudioStreamPlayer.stop()
