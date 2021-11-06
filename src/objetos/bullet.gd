extends KinematicBody2D

var direcaoBala : Vector2
export(int) var velocidadeBala : = 500
var damageBullet

func _ready():
	look_at(get_global_mouse_position())
	direcaoBala = Vector2(velocidadeBala, 0).rotated(rotation)

func _physics_process(delta):
	move_and_slide(direcaoBala)

func _on_Area2D_body_entered(body):
#	queue_free()
	pass
