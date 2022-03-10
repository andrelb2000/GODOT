extends Node2D
var passosX = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	# Pega o numero de passos, que agora é global para as duas cenas e poe na cena
	$LabelPassos.text = String($"/root/Singleton".nrPassos)
	# Posiciona na ultima posicao da cena anterior, ou seja, mantem a mesma posicao entre as cenas
	$Icon.position = $"/root/Singleton".last_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonDireita_pressed():
	# Aumenta o numero de passos, que agora é global para as duas cenas e poe na cena
	$"/root/Singleton".nrPassos =  $"/root/Singleton".nrPassos + 50
	$LabelPassos.text = String($"/root/Singleton".nrPassos)
	passosX +=50
	#Move e troca de cena se chega a um numero x de passo,s nao importando aqui se é direita ou esquerda
	$Icon.move_local_x(10)
	if passosX > 300:
		$"/root/Singleton".last_position = $Icon.position
		get_tree().change_scene("res://Node2DCena2.tscn")

