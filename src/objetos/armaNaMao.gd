extends Node2D

var bullet = preload("res://src/objetos/bullet.tscn")
var forcaDisparo = 60
export (int) var desenhoArma
export (int) var d

func tiro():
	var new_bullet = bullet.instance()
	new_bullet.damageBullet = d
	new_bullet.position = global_position
	Global.cenaPrincipal.add_child(new_bullet)
