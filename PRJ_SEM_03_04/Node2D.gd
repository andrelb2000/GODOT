extends Node2D

# CONTROLE MESTRE
# VARIÁVEIS do sistema
var movDx = []
onready var movVector = Vector2(1,1)
onready var drone1 = $SpriteDrone1
onready var drone2 = $SpriteDrone2
onready var drone3 = $SpriteDrone3
onready var drone4 = $SpriteDrone4
onready var drones = []

#CONTROLE MESTRE - INICIALIZAR
func _ready():
	randomize()
	drones.append(drone1)
	movDx.append( (randi() % 40)/10 + 1 )
	drones.append(drone2)
	movDx.append( (randi() % 40)/10 + 1 )
	drones.append(drone3)
	movDx.append( (randi() % 40)/10 + 1 )
	drones.append(drone4)
	movDx.append( (randi() % 40)/10 + 1 )

#CONTROLE - Regras e Funcoes
func chegouLimite():
	for drone in drones:
		if (drone.position.x > 800):
			drone.position.x = 0
func ganhador():
	var primeiro = -1
	var posicaoPrimeiro = -1
	var droneGanhador = null
	var i = 0
	for drone in drones:
		if (drone.position.x > posicaoPrimeiro):
			posicaoPrimeiro = drone.position.x
			droneGanhador = drone
			primeiro = i
		i = i + 1
	return primeiro
func trocaVelocidade():
	randomize()
	for i in range(4):
		movDx[i] = ( (randi() % 40)/30 + 1 )
	
# VISUAL - ENTRADA de DADOS	
func _on_Button_pressed():
	trocaVelocidade()
		
func _on_ButtonGanhador_pressed():
	var g = ganhador()
	$LabelGanhador.text = "Ganhador - Drone " + String(g)

# VISUAL - SAIDA
# Moviemento dos drones
func _process(delta):
	var i = 0
	for drone in drones:
		drone.move_local_x(movDx[i])
		i += 1
	chegouLimite()
