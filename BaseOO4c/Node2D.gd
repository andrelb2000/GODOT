extends Node2D

class PapaLeguas:
	var correndo = 0
	var velocidadeX = 0
	var velocidadeY = 0
	var limiteX = 1920
	var limiteY = 1080
	var posicao = Vector2(1000,500)
	func poePosicaoInicial():
		posicao = Vector2(1000,500)
		return posicao
	func atualizaVelocidade():
		## COMPLETE Aqui ##
		return Vector2(velocidadeX,velocidadeY)
	func atualizaPosicao(p):
		posicao = p
		## CONPLETE AQUI ##		
		return posicao
	func correr():
		correndo = 1
	func parar():
		## COMPLETE AQUI ##
		velocidadeY = 0

var papaLeguas = PapaLeguas.new()
func _ready():
	randomize()
	$Rr1.position = papaLeguas.poePosicaoInicial()
func _process(delta):
	var v = papaLeguas.atualizaVelocidade()
	$Rr1.move_local_x(v.x)
	$Rr1.move_local_y(v.y)
	$Rr1.position = papaLeguas.atualizaPosicao($Rr1.position)
func _on_RunButton_pressed():
	papaLeguas.correr()	
	$RRAudioStreamPlayer.play()
func _on_StopButton_pressed():
	papaLeguas.parar()
	$RRAudioStreamPlayer.stop()
