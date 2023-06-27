extends Spatial

signal camera_1		# Cámara de primera persona
signal camera_2		# Resto de cámara de videovigilancia
signal camera_3
signal camera_4
signal camera_5

var camera := 1
var num_cameras := 5

onready var instrucciones = get_node("Interfaz")

onready var raiz = get_node(".")
var manage: bool = true		# Manejar una sitauación indeseada

func _ready():
	emit_signal("camera_"+str(camera))
	var salaT = get_node("SalaTransportador")
	raiz.remove_child(salaT)
	salaT.call_deferred("free")


func _process(_delta):
	if Input.is_action_just_pressed("change_camera"):
		camera = (camera+1) % (num_cameras+1)
		if camera == 0:
			camera = 1
		emit_signal("camera_"+str(camera))

	if Input.is_action_just_pressed("show_hide_interface"):
		if instrucciones.visible:
			instrucciones.hide()
		else:
			instrucciones.show()

# Cargar la salaT y descargar puente
func _on_AreaCercaPuente_body_exited(body):
	if body.name == "Player":
		var puente = raiz.get_node("Puente")
		if puente != null and manage:
			raiz.remove_child(puente)
			puente.call_deferred("free")
			# print("Puente descargado")
			var salaT = load("res://GODOT/SalaTransportador/SalaTransportadorCompleta.tscn").instance()
			if (raiz.get_node("SalaTransportador") == null):
				salaT.global_transform.origin = Vector3(-54.585, 0.05, 89.8)
				raiz.add_child(salaT)
				# print("Sala Transportador cargada")
				manage = true

# Descargar salaT y cargar puente
func _on_AreaCercaPuente_body_entered(body):
	if body.name == "Player":
		var salaT = raiz.get_node("SalaTransportador")
		if salaT != null:
			raiz.remove_child(salaT)
			salaT.call_deferred("free")
			# print("Sala Transportador descargada")
			var puente = load("res://GODOT/Puente/PuenteCompleto.tscn").instance()
			puente.global_transform.origin = Vector3(57.52, 0.038, -110.721)
			raiz.add_child(puente)
			# print("Puente cargado")
			manage = false
		else:
			manage = true

# Las coordenadas van a mano porque el global_transform.origin me da X y Z intercambiadas.
