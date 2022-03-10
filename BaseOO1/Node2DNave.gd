extends Node2D

func _ready():
	$SpriteNave.inicarLimites(0,0,1000,1000)
	$SpriteNave.voltaInicio()
	
func _process(delta):
	if $SpriteNave.dentroLimites():
		$SpriteNave.moverDireita()
	else:
		$SpriteNave.voltaInicio()
		$SpriteNave.frear(3)
