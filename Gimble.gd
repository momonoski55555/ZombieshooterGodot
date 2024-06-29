extends Node3D

@export_range(0.0 , 1.0 ) var Sens: float


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func  _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * Sens))
		$Camera3D.rotation.x += deg_to_rad(-event.relative.y * Sens)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x , deg_to_rad(-89), deg_to_rad(89))
		
	
