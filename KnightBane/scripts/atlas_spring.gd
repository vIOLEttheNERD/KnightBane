extends SpringArm3D

@export var mouse_sensitivity: float = 0.005

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
		if event is InputEventMouseMotion:
			rotation.y -= event.relative.x * mouse_sensitivity
			rotation.y = wrapf(rotation.y, 0.0, TAU)
			
			rotation.x -= event.relative.y * mouse_sensitivity
			rotation.x = clamp(rotation.x, -PI/2, PI/4)
