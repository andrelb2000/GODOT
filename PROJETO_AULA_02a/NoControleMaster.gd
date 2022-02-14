extends Node2D
#CONTROLE e VARIAVEIS
const limiteEscala = 3
const limiteX = 500
const escalaInicial = 0.1
var contador = escalaInicial
var dx = 1
var posicaoX = 0

#DADOS ou INFORMACAO ARMAZENADA
var passo = 0.01

# PONTO DE ENTRADA DO PROGRAMA
func _ready():
	$TaxaCrescimento.text = String(passo)

func _process(delta):
	# CONTROLE - REGRAS DE NEGOCIO
	contador += passo
	if contador >= limiteEscala:
		contador = escalaInicial
	posicaoX += dx
	if posicaoX > limiteX  or posicaoX < 0:
		dx = -dx

	# VISUAL - SAIDA de informações	
	$Sprite.scale.x = contador
	$Sprite.scale.y = contador	
	$Sprite.move_local_x(dx)		
	$Velocidade.text = String(dx)

# VISUAL - ENTRADA de informações
func _on_Button_pressed():
	#DADOS ou INFORMACAO ARMAZENADA
	passo = float($TaxaCrescimento.text)
