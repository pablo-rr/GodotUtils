class_name StateMachine, "res://Addons/StateMachine/stateMachine.png"
extends Node

signal transitioned(state_name)

export var initial_state : NodePath

onready var state : State = get_node(initial_state)
onready var states : Array = []

func _ready() -> void:
	yield(owner, "ready")
	for child in get_children():
		if(child is State):
			child.state_machine = self
	state.enter()
	
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
	
func _process(delta: float) -> void:
	state.process(delta)
	
func _physics_process(delta: float) -> void:
	state.physics_process(delta)
	
func transition_to(state_name : String, message : Dictionary) -> void:
	if(not has_node(state_name)):
		return
		
	state.exit()
	state = get_node(state_name)
	state.enter(message)
	emit_signal("transitioned", state_name)
