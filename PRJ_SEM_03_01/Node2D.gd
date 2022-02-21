extends Node2D

# CONTROLE MESTRE
# VARIÁVEIS do sistema
var movDx = 1
onready var drone1 = $SpriteDrone1
onready var drone2 = $SpriteDrone2
onready var drone3 = $SpriteDrone3
onready var drone4 = $SpriteDrone4

func _ready():
	pass # Replace with function body.

# VISUAL - SAIDA
# Moviemento dos drones
func _process(delta):
	drone1.move_local_x(movDx)
	drone2.move_local_x(movDx)
	drone3.move_local_x(movDx)
	drone4.move_local_x(movDx)
