extends Area2D

export var speed = 100
var screen_size
signal pontua2


func _ready():
	screen_size=get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("desce"):
		velocity.y += 1
	if Input.is_action_pressed("sobe"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity*delta
	# Nao sair da tela
	position.y = clamp(position.y, 0, screen_size.y)
	#Tocar animacoes
	if velocity.y > 0:
		$AnimatedSprite.animation = "baixo"
	if velocity.y < 0:
		$AnimatedSprite.animation = "cima"
	
	
func _on_Player2_body_entered(body):
	if body.name == "ganha":
		emit_signal("pontua2")
	else:
		$AudioStreamPlayer2D.play()
	position.x = 320
	position.y = 696

