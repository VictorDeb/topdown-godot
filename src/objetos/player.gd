extends KinematicBody2D

var armado : bool = false
var gun

var input : Vector2

var VELOCIDADE : int = 200
var DIRECAO : Vector2

func _physics_process(delta):
	
	look_at(get_global_mouse_position())
	
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if input.x != 0 and input.y != 0:
		VELOCIDADE = 150
	else:
		VELOCIDADE = 200
	
	DIRECAO.x = input.x * VELOCIDADE
	DIRECAO.y = input.y * VELOCIDADE

	if armado:
		if Input.is_action_just_pressed("atirar"):
			gun.tiro()
		gun.global_position = $positionBullet.global_position
		$informacao.visible = true
		$informacao.set_text("armado")
	
	DIRECAO = move_and_slide(DIRECAO)
