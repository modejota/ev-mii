extends RigidBody

var cerca = false
var player: KinematicBody
var agarrado = false

func _physics_process(_delta:float) -> void:
	if Input.is_action_just_pressed("left_click"):
		if agarrado:
			agarrado = false
			rotation = Vector3(0,rotation.y,0)
			apply_central_impulse(Vector3(0,1,0))
		elif cerca and not agarrado:
			agarrado = true
	if agarrado:
		global_transform=player.get_child(1).get_child(1).global_transform
		# Busco las ManosAux para ponerlo algo por delante de la cámara y fuera de la colisión
		# El soltarlo no es el efecto más suave del mundo, pero también es verdad 
		# que he cogido el objeto con las patas más inestables que había en todo Internet.

func _on_Area_body_entered(body):
	if body.name == "Player":
		player = body
		cerca = true

func _on_Area_body_exited(body):
	if body.name == "Player":
		cerca = false
