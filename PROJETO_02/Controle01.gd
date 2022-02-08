extends Node2D
# AREA DE CONTROLE
var contador = 0
func _ready():
	$Label.text = "TEXTO INICIAL"

# AREA VISUAL - SAIDA
func _process(delta):

	# AREA CONTROLE
	if (contador % 3) == 0:
		$Label.text = String(contador)

# AREA VISUAL - ENTRADA
func _on_Button_pressed():
	contador += 1
