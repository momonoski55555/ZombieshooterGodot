extends Node3D

@export var menu: Menu
var Sens: float

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func  _input(event: InputEvent) -> void:
	Sens = menu.sens
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * Sens))
		$Camera3D.rotation.x += deg_to_rad(-event.relative.y * Sens)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x , deg_to_rad(-89), deg_to_rad(89))
		

