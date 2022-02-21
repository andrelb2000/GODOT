extends Node2D

# CONTROLE MESTRE
# VARIÁVEIS do sistema
var movDx = 1
var distanciaDrone1 = 0
onready var movVector = Vector2(1,1)
onready var drone1 = $SpriteDrone1
onready var drone2 = $SpriteDrone2
onready var drone3 = $SpriteDrone3
onready var drone4 = $SpriteDrone4
onready var drones = []

func _ready():
	drones.append(drone1)
	drones.append(drone2)
	drones.append(drone3)
	drones.append(drone4)
	$LineEditDirecao.text = "0.0"

# VISUAL - SAIDA
# Moviemento dos drones
func _process(delta):
	for drone in drones:
		drone.move_local_x(movVector.x)
		drone.move_local_y(movVector.y)
	distanciaDrone1 += movVector.length()
	$LabelDistDrone1.text = String(distanciaDrone1)

func _on_ButtonDirecao_pressed():
	var angulo = float($LineEditDirecao.text)
	var anguloRadianos = (PI *  angulo/180)
	movVector = movVector.rotated(anguloRadianos)

func _on_Button10DegUp_pressed():
	sobe("Drone x",10)

func _on_Button10DegDown_pressed():
	var anguloRadianos = (PI *  10/180)
	movVector = movVector.rotated(anguloRadianos)
	$LineEditDirecao.text = "10.0"
	
#############################################
func sobe(drone,angulo):
	var anguloRadianos = (-PI *  angulo/180)
	movVector = movVector.rotated(anguloRadianos)
	$LineEditDirecao.text = String(-1*angulo)
