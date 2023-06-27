extends Camera


onready var Yaw = get_parent()
export var sensibilidad_raton := 500
export var angulo_max := 70
export var velocidad_andar := 10

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if current:
		var speed = delta*velocidad_andar
		if Input.is_action_pressed("fpc_arriba"):
			Yaw.translate_object_local(Vector3(0,0,-speed))
		if Input.is_action_pressed("fpc_abajo"):
			Yaw.translate_object_local(Vector3(0,0,speed))
		if Input.is_action_pressed("fpc_izq"):
			Yaw.translate_object_local(Vector3(-speed,0,0))
		if Input.is_action_pressed("fpc_der"):
			Yaw.translate_object_local(Vector3(speed,0,0))

func _input(event):
	if event is InputEventMouseMotion and current:
		Yaw.rotate_object_local(Vector3(0,1,0),  -event.relative.x/sensibilidad_raton)
		var y_ajustada = -event.relative.y/sensibilidad_raton
		if rotation_degrees.x <= angulo_max:
			if rotation_degrees.x >= -angulo_max:
				rotate_object_local(Vector3(1,0,0), y_ajustada)
			elif event.relative.y<0:	# Poder subir cámara cuando llega al tope negativo en X
				rotate_object_local(Vector3(1,0,0), y_ajustada) 
		elif event.relative.y>0:	# Poder bajar cámara cuando llega al tope positivo en X
			rotate_object_local(Vector3(1,0,0), y_ajustada)

func _on_PuenteCompleto_P4_camera_1():
	current = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
