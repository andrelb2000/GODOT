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
	func posicaoPapaLeguas():
		return posicao
	func atualizaVelocidade():
		if correndo:
			var direcao = randi() % 2
			if direcao:
				velocidadeX = randi() % 50  - 25
			else:
				velocidadeY = randi() %  30  - 15 
	func obterVelocidade():
		return Vector2(velocidadeX,velocidadeY)
	func atualizaPosicao(p):
		posicao = p
		if posicao.x > limiteX or posicao.x < 0 or posicao.y > limiteY or posicao.y < 0:
			self.poePosicaoInicial()
		return 
	func obterPosicao():
		return posicao	
	func correr():
		correndo = 1
	func parar():
		correndo = 0
		velocidadeX = 0
		velocidadeY = 0
	func estaCorrendo():
		return correndo
		
var papaLeguas = PapaLeguas.new()
var passos = 0	
var tocando = 0
var passoTocando = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	papaLeguas.poePosicaoInicial()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(passos % 5 == 0):
		papaLeguas.atualizaVelocidade()
	passos +=1
	var v = papaLeguas.obterVelocidade()
	$Rr1.move_local_x(v.x)				
	$Rr1.move_local_y(v.y)
	$Rr1.position = papaLeguas.atualizaPosicao($Rr1.position)
	 

	tocando +=passoTocando
	if tocando > 20:
		tocando = 0
		passoTocando = 0
		$Rr1/BBAudioStreamPlayer.stop()

func _on_RunButton_pressed():
	papaLeguas.correr()	
	$RRAudioStreamPlayer.play()

func _on_StopButton_pressed():
	papaLeguas.parar()
	$RRAudioStreamPlayer.stop()
	$Rr1/BBAudioStreamPlayer.stop()

func _on_Button_pressed():
	$Rr1/BBAudioStreamPlayer.play()
	passoTocando = 1
	


