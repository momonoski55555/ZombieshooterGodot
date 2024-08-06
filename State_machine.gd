class_name state_machine
extends Node

@export var Starting_State: State_node

var current_state: State_node 

var States: Dictionary 

func _ready() -> void:
	for i in get_children():
		if i is State_node:
			States[i.name.to_lower()] = i
	if Starting_State:
		Starting_State.enter()
		current_state = Starting_State



func change_State(from: State_node, to: String) -> void:
	if current_state != from:
		return
	
	var next_state: State_node = States.get(to.to_lower())
	if !next_state:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = next_state


func _physics_process(_delta: float) -> void:
	if current_state:
		current_state._update()
