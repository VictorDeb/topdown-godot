extends Node

onready var cenaPrincipal = get_tree().get_root().get_node("/root/sceneManager")

var infoPlayer = {
	"name": "", 
	"age": "", 
	"sex": ""
}

func change_scene(cena, transition):
	var nodeCurrent = cenaPrincipal.get_node("currentScene")
	var cenaAtual = nodeCurrent.get_child(0)
	
	cenaPrincipal.add_child(transition)
	
	transition.animation_init()
	
	yield(get_tree().create_timer(1.0), "timeout")
	
	nodeCurrent.remove_child(cenaAtual)
	nodeCurrent.add_child(cena)
	
	transition.animation_finish()
