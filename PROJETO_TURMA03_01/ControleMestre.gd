extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var contador = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Rotulo.text = "Meu Programa"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	contador = contador + 1
	$Rotulo.text = "Esse é o programa do Prof. Darth Braga" + String(contador)
	
	
	
