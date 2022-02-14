extends Node2D
#CONTROLE e VARIAVEIS
const limiteEscala = 3
const limiteX = 500
const escalaInicial = 0.1
var passo = 0.01
var contador = escalaInicial
var dx = 1
var posicaoX = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$TaxaCrescimento.text = String(passo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contador += passo
	if contador >= limiteEscala:
		contador = escalaInicial
	posicaoX += dx
	if posicaoX > limiteX  or posicaoX < 0:
		dx = -dx

	
	$Sprite.scale.x = contador
	$Sprite.scale.y = contador	
	$Sprite.move_local_x(dx)		
	$Velocidade.text = String(dx)
	



func _on_Button_pressed():
	passo = float($TaxaCrescimento.text)
