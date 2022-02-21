extends Node2D

# CONTROLE MESTRE
# VARIÁVEIS do sistema
var movDx = 1
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

# VISUAL - SAIDA
# Moviemento dos drones
func _process(delta):
	for drone in drones:
		drone.move_local_x(movDx)
