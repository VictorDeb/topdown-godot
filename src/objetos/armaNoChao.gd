extends KinematicBody2D

var jogadorProximo : bool = false
var player

export (PackedScene) var armaNaMao

func _physics_process(delta):
	
	if jogadorProximo and Input.is_action_pressed("atirar"):
		player.armado = true
		player.gun = armaNaMao.instance()
		player.add_child(player.gun)
		queue_free()
	

func _on_areaDeContato_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player.get_node("informacao").visible = true
		player.get_node("informacao").set_text("Aperte botão esquerdo do mouse")
		jogadorProximo = true

func _on_areaDeContato_body_exited(body):
	if body.is_in_group("player"):
		player.get_node("informacao").visible = false
		player.get_node("informacao").set_text("Aperte botão esquerdo do mouse")
		jogadorProximo = false
