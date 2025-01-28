extends Node3D

var input_dir := Vector2.ZERO
var Speed := 5.0
var cam_vec := Vector3.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func  _input(event: InputEvent) -> void:
	var Sens = 0.5
	
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * Sens))
		$Camera3D.rotation.x += deg_to_rad(-event.relative.y * Sens)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x , deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta):
	
	var inputy = Input.get_action_strength("ui_accept") - Input.get_action_strength("Ctrl")

	input_dir = Input.get_vector("W","S","A","D")

	cam_vec = $Camera3D.global_transform.basis * Vector3(input_dir.y, inputy,input_dir.x).normalized()

	global_translate(cam_vec)
