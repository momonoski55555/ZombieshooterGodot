extends CharacterBody3D

var Crouching: bool = false
var SPEED: float = 5.0
const JUMP_VELOCITY: float = 4.5


var gravity := 9.5
var cam_aligned_vec := Vector3.ZERO
var noclip := false
var noclip_speed := 5.0 



func _physics_process(delta: float) -> void:


	
	var input_dir := Input.get_vector("A", "D", "W", "S")
	var direction: Vector3 = ($Gimble/Camera3D.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity = lerp(velocity, Vector3.ZERO, delta * 5)
	
	if Input.is_action_pressed("ui_accept") :
		velocity.y += JUMP_VELOCITY
	
	
	move_and_slide()
