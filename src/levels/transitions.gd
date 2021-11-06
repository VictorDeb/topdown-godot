extends CanvasLayer

func animation_init():
	$AnimationPlayer.play_backwards("abrindo")

func animation_finish():
	$AnimationPlayer.play("abrindo")
	yield(get_tree().create_timer(1.0), "timeout")
	self.queue_free()
