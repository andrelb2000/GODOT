extends Node2D
# QUESTAO 1 #
class CapacitorDeFluxo:
	var tempoAtual       = 0
	var tempoInicial	 = 0
	var tempoDestino     = 0
	const velocidadeBase   = 85
	var velocidadeAtual  = 10
	var multiEspacoX     = 0
	var multiEspacoY     = 0	
	var cargaPlutonioPer = 100
	func acelerar(taxa):
		velocidadeAtual *= (1 + float(taxa)/100)
	func atualizaDestino(x,y,tempod,tempoi):		
		tempoInicial	 = tempoi
		tempoDestino     = tempod
		multiEspacoX     = x
		multiEspacoY     = y
	func timeTravel(tatual):
		if velocidadeAtual >= velocidadeBase:
			multiEspacoX += (tatual - tempoInicial) * (velocidadeAtual - velocidadeBase) 
			multiEspacoY += (tatual - tempoInicial) * (velocidadeAtual - velocidadeBase)/2 
			tatual = tempoDestino
			cargaPlutonioPer -= 50			
			return true
		else:
			print("Velocidade:"+str(velocidadeAtual) + " carga Plutonio: " + str(cargaPlutonioPer) + "%")
			cargaPlutonioPer -= 0.1			
			return false
	func obterDeslocamentoDestino():
		return (  sqrt( pow(multiEspacoX,2) + pow(multiEspacoY,2) )  )
onready var delorean = CapacitorDeFluxo.new()
var tempo = 2022
var chegouAoFuturo = true
var deslocamentoTemporal = 0.01
##################################
# QUESTAO 2 #
var primeiroContato = false
var mensagem = 0
var paz = 0
var curiosidade = 0
var perigo = 0
var nos_voces = 0
##################################
# QUESTAO 3 #
var dalekList = []
var tardis = [15,45,100,1512]
func dalekInterceptado(dalek,td):
	if  dalek[0] > (td[0] - 10) and dalek[0] < (td[0] + 10) and \
		dalek[1] > (td[1] - 10) and dalek[1] < (td[1] + 10) and \
		dalek[2] > (td[2] - 10) and dalek[2] < (td[2] + 10) and \
		dalek[3] == td[3]:
			return true
	else:
			return false 
func interceptaDalek(dlist,td):
	var achado = false
	var dalekAchado = null
	for d in dlist:
		if dalekInterceptado(d,td):
			achado = true
			dalekAchado = d
	if achado:
		return dalekAchado
	else:
		return [-1,0,0,0,0]
func chaveSonicaEmDalek(dalek):
	dalek[4] -= 20

# QUESTAO 4 #
func disparaAlvo(nave,posicaoAlvo,erro):
	var dxAlvo = 0
	var dyAlvo = 0
	dxAlvo = (posicaoAlvo.x - nave.x)
	dyAlvo = (posicaoAlvo.y - nave.y)
	var distanciaAlvo = sqrt(pow(dxAlvo,2) + pow(dyAlvo,2))
	var anguloAlvo = (1.0 + float(erro)/100) * 180.0 * atan2(dyAlvo,dxAlvo) / PI
	#print (str(float(anguloAlvo)))
	var novoDy = distanciaAlvo * sin(PI * anguloAlvo / 180)
	var novoDx = distanciaAlvo * cos(PI * anguloAlvo / 180) 
	var novaDistanciaAlvo = sqrt(pow((dxAlvo-novoDx),2) +pow((dyAlvo - novoDy),2))
	var percentualErro = 100 * novaDistanciaAlvo / distanciaAlvo
	if (percentualErro < (erro / 2)):
		return true
	else:
		return false
##################################

# QUESTAO 5 #
var listaZumbis = []

func investigaAtaque(lista,pista):
	var zumbiAnterior = null
	var nrZumbi = 0
	for z in lista:
		nrZumbi +=1
		z[1] = nrZumbi
		if zumbiAnterior == null:
			z[0] = pista
			zumbiAnterior = z			
		else:			
			z[0] = " ->" + zumbiAnterior[0]
			zumbiAnterior = z
		
func mostraZumbis(lista):
	for z in lista:
		print("Zumbi "+str(z[1]) + " Pista: "+ str(z[0]) )
		




##################################




# Called when the node enters the scene tree for the first time.
func _ready():
	listaZumbis.append([0,0])
	listaZumbis.append([0,0])
	listaZumbis.append([0,0])
	listaZumbis.append([0,0])
	listaZumbis.append([0,0])
	investigaAtaque(listaZumbis,"Cabeça cortada")
	mostraZumbis(listaZumbis)
	
	
	
	dalekList.append([10,40,5,100,100])
	dalekList.append([60,40,5,512,100])
	dalekList.append([10,40,50,1023,100])
	dalekList.append([20,40,105,1512,100])
	dalekList.append([10,40,200,1920,100])
	dalekList.append([30,70,5,2022,100])
	var dalek = interceptaDalek(dalekList,tardis)
	if dalek[0] >= 0:
		chaveSonicaEmDalek(dalek)
		print("Desmontando dalek "+ str(dalek))
		
	
	
	var naveLuke = Vector2(0,0)
	var estrelaMorte = Vector2(200,100)
	if disparaAlvo(naveLuke,estrelaMorte,20):
		print("Atingiu a estrela da morte com 20% de erro")
	if disparaAlvo(naveLuke,estrelaMorte,15):
		print("Atingiu a estrela da morte com 15% de erro")
	if disparaAlvo(naveLuke,estrelaMorte,10):
		print("Atingiu a estrela da morte com 10% de erro")
	if disparaAlvo(naveLuke,estrelaMorte,5):
		print("Atingiu a estrela da morte com 5% de erro")
		
	delorean.atualizaDestino(0,0,1800,2020)
		
	while(mensagem < 80):		
		# Nos queremos saber porque puseram em perigo Nos que viemos em paz #
		mensagem = nos_voces + curiosidade + perigo + nos_voces + paz
		paz += 5
		curiosidade += 10
		perigo += 7
		nos_voces += 13
		if paz > 99: 			
			paz = 0
		if curiosidade > 99: 
			curiosidade = 0
		if perigo > 99: 
			perigo = 0
		if nos_voces > 99: 
			nos_voces = 0
	if mensagem >=80 and mensagem < 85:
		print ("Primeiro Contato - Evitou desastre: " + str(mensagem) + "% de eficiencia")
	elif mensagem >=85 and mensagem < 90:
		print ("Primeiro Contato - Fez amizades: " + str(mensagem) + "% de eficiencia")	
	elif mensagem >=90 and mensagem<=100:
		print ("Primeiro Contato - Aliança para a federação: " + str(mensagem) + "% de eficiencia")	
	else:		
		print ("Primeiro Contato - Seres alem da compreensão: " + str(mensagem) + "% de eficiencia")	# Called every frame. 'delta' is the elapsed time since the previous frame.


	
	
	
	
func _process(delta):
	delorean.acelerar(20)
	tempo += deslocamentoTemporal
	if delorean.timeTravel(tempo) and chegouAoFuturo:
		print("Chegou ao futuro: " + str(delorean.obterDeslocamentoDestino())  + " Carga Plutonio:" + str(delorean.cargaPlutonioPer) + "%" + " vel:"+str(delorean.velocidadeAtual))
		chegouAoFuturo = false

