extends Node2D


var listaNomes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonAdiciona_pressed():
	listaNomes.append([$LineEditNome.text,$LineEditIdade.text])
	$RichTextLabelLIsta.text += $LineEditNome.text + "  -  " + 	$LineEditIdade.text + "\n"


func _on_ButtonTotal_pressed():
	var total = 0
	for l in listaNomes:
		total += int(l[1])
	$LabelTotalGeral.text = str(total)
