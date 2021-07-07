extends Node
const novo_carro = preload("res://carros.tscn")
var pdevagar = [600, 544, 438, 324, 384, 216, 160]
var prapido = [488, 272, 104]

var score1 = 0
var score2 = 0

func _ready():
	pass


func _on_hora_carro_devagar_timeout():
	var carro_devagar = novo_carro.instance()
	add_child(carro_devagar)
	carro_devagar.position.x = - 10
	carro_devagar.position.y = pdevagar[randi() % prapido.size()]
	carro_devagar.linear_velocity = Vector2(rand_range(300, 310), 0)
	


func _on_hora_carro_rapido_timeout():
	var carro_rapido = novo_carro.instance()
	add_child(carro_rapido)
	carro_rapido.position.x = - 10
	carro_rapido.position.y = prapido[randi() % prapido.size()]
	carro_rapido.linear_velocity = Vector2(rand_range(700, 710), 0)


func _on_Player_pontua():
	if score1 < 10:
		score1 += 1
		$ponto.play()
		$placar1.text = str(score1)
	if score1 >= 10:
		$tema.stop()
		$resultado.text = "P1 Ganhou"
		$ganhou.play()
		$hora_carro_devagar.stop()
		$hora_carro_rapido.stop()
		
func _on_Player2_pontua2():
	if score2 < 10:
		score2 += 1
		$ponto.play()
		$placar2.text = str(score2)
	if score2 >= 10:
		$tema.stop()
		$resultado.text = "P2 Ganhou"
		$ganhou.play()
		$hora_carro_devagar.stop()
		$hora_carro_rapido.stop()
