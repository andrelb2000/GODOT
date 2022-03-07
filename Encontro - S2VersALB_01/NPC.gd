extends KinematicBody2D

#onready carrega antes de qualquer item da cena, serve para carregar objetos da cena em variáveis
onready var obj = get_parent().get_node("Ponto")
onready var obj2 = get_parent().get_node("Ponto2")
#Criando um índice para a lista de objetos
var i = 0
#Verificador para troca de alvo
var atingiu_alvo = true

func _physics_process(delta):
	#Cria uma lista de destinos, definidos por objetos na cena
	var destination = [obj, obj2]
	#Define um vector2 de direção através da diferença entre a posição do NPC e a posição do objeto/destino. Normalized serve como módulo na matemática
	var dir = (destination[i].global_position - self.global_position).normalized()
	#Captura o movimento com o intuito de obter colisões
	var collision = move_and_collide(dir)
	
	#Código para animação do NPC
	if(dir.x > 0):
		$"Sprite - Personagem/AnimationPlayer - Animação".play("Andar_Direita")
	elif(dir.x < 0):
		#Código esquerda
		pass
	if(dir.y > 0):
		#Código baixo
		pass
	elif(dir.y < 0):
		#Código cima
		pass
	if(dir == Vector2.ZERO):
		#Código Parado
		pass
	#Comando para movimentação do NPC
	move_and_collide(dir)
	#Código para detectar colisão e direcionar para o próximo ponto
	if(collision):
		if(collision.collider.name == "Ponto" && atingiu_alvo):
			i+=1
			atingiu_alvo=false
		elif(collision.collider.name == "Ponto2"):
			i=0
			atingiu_alvo=true
