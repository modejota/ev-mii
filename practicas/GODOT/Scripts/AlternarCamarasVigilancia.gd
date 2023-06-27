extends Node

# Referencias a las cuatro cámaras de vigilancia (matengo indices, la 1 es la FPC)
var camera2: Camera
var camera3: Camera
var camera4: Camera
var camera5: Camera

func _ready():
	camera2 = get_node("CameraObjetoTextura")
	camera3 = get_node("CameraTodoPuente")
	camera4 = get_node("CameraPasillo")
	camera5 = get_node("CameraSalaT")


func _on_PuenteCompleto_P4_camera_2():
	camera2.current = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_PuenteCompleto_P4_camera_3():
	camera3.current = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_PuenteCompleto_P4_camera_4():
	camera4.current = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_PuenteCompleto_P4_camera_5():
	camera5.current = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
