extends RayCast

onready var mensaje = $MensajeInteractuar

func _ready():
	add_exception(owner)
	
func _physics_process(_delta):
	mensaje.text = ""
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interactable:
			mensaje.text = detected.get_prompt()
			
			if Input.is_action_just_pressed(detected.prompt_action):
					detected.interact(owner)
