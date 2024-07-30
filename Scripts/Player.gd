extends CharacterBody3D


const SPEED: float = 5.0
const JUMP_VELOCITY: float = 4.5

var gravity := 9.5

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y -= gravity  * delta
	else:
		var input_dir := Input.get_vector("A", "D", "W", "S")
		var direction: Vector3 = ($Gimble.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity = direction * SPEED
		else:
			velocity = lerp(velocity, Vector3.ZERO, delta * 5)
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()
