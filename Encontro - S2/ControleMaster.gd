extends Node2D
var nota1 
var nota2
var nota3
var mediaFinal
var status
var conceito
var saida
var simulacao = false
var n
#export (String, FILE, "Principal.tscn") var cena
#var posicao	
func obterSaida(mf, st, c):
	var texto = "SUA MÉDIA FINAL FOI " + String(mf) + "\nVOCÊ ESTÁ: " + String(st)  + "\nCONCEITO: " + String(c)
	return texto

	
func _ready():
	simulacao = false
		
func _process(delta):
	if simulacao:
		nota1 = float($nota1.text)
		nota2 = float($nota2.text)
		nota3 = float($nota3.text)
		
		
		if nota1 > 0 and nota2 > 0 and nota3 >0:
			mediaFinal = float (nota1 + nota2 + nota3) / 3
			
			if(mediaFinal >= 7): status = "APROVADO(A)"
			else: status = "REPROVADO(A)"
			
			if(mediaFinal >= 9): conceito = "A"
			elif(mediaFinal >= 8): conceito = "B"
			elif(mediaFinal >= 7): conceito = "C"
			elif(mediaFinal >= 6): conceito = "D"
			else: conceito = "E"
			
			$Saida.text = obterSaida(mediaFinal, status, conceito)
			 
			#simulacao = false
		else:
			$Saida.text = "COLOCAR VALORES VÁLIDOS PARA AS NOTAS"
			simulacao = false

		
func _on_Iniciar_pressed():
	simulacao = true



func _on_Voltar_pressed():
#	posicao = get_node(cena)
#	posicao.get_node("KinematicBody2D - Jogador").position = Vector2(702,233)
	get_tree().change_scene("res://Principal.tscn")
#	Global.goto_scene("Principal.tscn", Vector2(710,210))
