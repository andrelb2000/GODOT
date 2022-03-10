extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Space/LabelPontos.text = String($"/root/Singleton".pontosObtidos)
	if $"/root/Singleton".pontosObtidos > 30    and  \
	   $"/root/Singleton".pontosObtidos <= 60:
		$LabelCategoria.text = "Padawan"
	elif $"/root/Singleton".pontosObtidos > 60    and  \
		 $"/root/Singleton".pontosObtidos <= 100:
		$LabelCategoria.text = "Cavaleiro JEDI"
	elif $"/root/Singleton".pontosObtidos > 100:
		$LabelCategoria.text = "Mestre JEDI"

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonBack_pressed():
	get_tree().change_scene("res://Principal.tscn")
