extends KinematicBody2D

#Variável de velocidade do jogador
var velocidade=100


func _ready():
	#Se houve teleporte, defina a posição global do personagem como última posição salva menos 100 em x e 25 em Y
	if(Singleton.teleport):
		Singleton.teleport=false
		self.global_position = Singleton.last_position + Vector2(-100,-25)
		get_parent().get_node("Sprite - Mapa/LabelPontos").text = String(Singleton.pontosObtidos)
#_physics_process roda a cada frame da tela, por segundo (Hz).
func _physics_process(delta):
	#Declarando o vetor de movimento como Vector2. Variável que possui dois dados, x e y
	var vetor_movimento = Vector2(0,0)
	#Definindo o movimento através do input do jogador. Caso ele pressione teclas que estejam definidas em Projetc -> Project Settings -> Input Map
	vetor_movimento.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	vetor_movimento.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	#Comando para mover e detectar colisões	
	move_and_slide(vetor_movimento*velocidade)
	
#Função que detecta a entrada no objeto de colisao (Antena de Raio da Estrela da morte)
#Configurado na aba NODE (ao lado de Inspector)
func _on_Area2D_body_entered(body):
	#Após detectar a entrada na Area2D, salve ALGO
	Singleton.last_position = self.global_position
	#Altere a variável teleport para garantir que houve um teleporte para outra cena
	Singleton.teleport=true
	Singleton.pontosObtidos = Singleton.pontosObtidos + 10 
	
	#Carrega a nova cena
	get_tree().change_scene("res://Node2D.tscn")
	
