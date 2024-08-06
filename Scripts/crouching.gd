extends State_node

@onready var collision_shape_3d = $"../../CollisionShape3D"

func exit() -> void:
	collision_shape_3d.scale.y = 1
	collision_shape_3d.position.y = 0

func enter() -> void:
	return

func _update() -> void:
	collision_shape_3d.scale.y = collision_shape_3d.scale.y / 2
	collision_shape_3d.position.y = 0.5
