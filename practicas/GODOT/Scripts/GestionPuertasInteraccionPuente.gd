extends Spatial

export var open = false

func toggle_door_animation(_body):
	open = !open
	
	if open:
		$Puertas/PuertaCorrederaA/AnimationPlayer.play("AbrirPuerta", -1, 1.0, false)
		$Puertas/PuertaCorrederaB/AnimationPlayer.play("AbrirPuerta", -1, 1.0, false)

	else:
		$Puertas/PuertaCorrederaA/AnimationPlayer.play("AbrirPuerta", -1, -1.0, true)
		$Puertas/PuertaCorrederaB/AnimationPlayer.play("AbrirPuerta", -1, -1.0, true)

func activate_red_alert(_body):
	$BotonRedAlert/AudioStreamPlayer.playing = true
	$BotonRedAlert/AnimationPlayer.play("RedAlert")	# Solo en el puente
	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 8.0  # Sleep for 8 seconds
	timer.one_shot = true
	timer.start()
	
	yield(timer, "timeout")  # Yield the function until the timer times out
	timer.queue_free()
	get_tree().quit()
