extends CanvasLayer

export(PackedScene) var transition
export(PackedScene) var next_scene
onready var dialogName : = $ConfirmationDialog 

func _ready():
	next_scene = next_scene.instance()
	transition = transition.instance()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("botaoProgramador"):
		Global.infoPlayer["name"] = "Programador"
		Global.change_scene(next_scene, transition)
	

func _on_btPlay_pressed():
	dialogName.visible = true
	dialogName.popup_centered()

func _on_ConfirmationDialog_confirmed():
	var name = dialogName.get_node("LineEdit").get_text()
	var caracteresPalavra = 0
	
	if !name.empty():
		for letra in name.lstrip(""):
			if letra == " ":
				caracteresPalavra += 1
	
	if caracteresPalavra == name.length() or name.empty():
		print("vc nn digitou nada, por favor informe um nome válido")
	else:
		Global.infoPlayer["name"] = name
	
	Global.change_scene(next_scene, transition)

func _on_btExit_pressed():
	get_tree().quit()

