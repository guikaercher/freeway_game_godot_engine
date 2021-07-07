extends RigidBody2D


func _ready():
	var cor_do_carro = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = cor_do_carro[randi() % cor_do_carro.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
