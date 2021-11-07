extends KinematicBody2D

var armado : bool = false
var podeAtirar : bool = true
var gun

var input : Vector2

var VELOCIDADE_MAX : int = 400
var ACELERACAO : int = 5
var DIRECAO : Vector2

func _physics_process(delta):
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("ui_down"):
		DIRECAO.y = min(DIRECAO.y + ACELERACAO, VELOCIDADE_MAX)
		pass
	elif Input.is_action_pressed("ui_up"):
		DIRECAO.y = max(DIRECAO.y - ACELERACAO, -VELOCIDADE_MAX)
		pass
	else: 
		DIRECAO.y = lerp(DIRECAO.y, 0, 0.2)

	if Input.is_action_pressed("ui_right"):
		DIRECAO.x = min(DIRECAO.x + ACELERACAO, VELOCIDADE_MAX)
		pass
	elif Input.is_action_pressed("ui_left"):
		DIRECAO.x = max(DIRECAO.x - ACELERACAO, -VELOCIDADE_MAX)
		pass
	else: 
		DIRECAO.x = lerp(DIRECAO.x, 0, 0.2)

	if armado:
		if Input.is_action_just_pressed("atirar") and podeAtirar:
			gun.tiro()
			repulsao(gun.forcaDisparo)
		gun.global_position = $positionBullet.global_position
		$informacao.visible = true
		$informacao.set_text("armado")
	
	DIRECAO = move_and_slide(DIRECAO)

func repulsao(forca):
	var mousePos = get_global_mouse_position().normalized()
	
	DIRECAO = -mousePos * forca 
	pass
