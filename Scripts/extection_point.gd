extends Area3D


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("Players"):
		get_tree().quit()
