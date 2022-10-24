class_name State, "res://Addons/StateMachine/state.png"
extends Node

signal entered(message)
signal exited

# Must be StateMachine
var state_machine = null

func handle_input(event : InputEvent) -> void:
	pass

func process(delta : float) -> void:
	pass
	
func physics_process(delta : float) -> void:
	pass
	
func enter(message : Dictionary = {}) -> void:
	emit_signal("entered", [message])
	
func exit() -> void:
	emit_signal("exited")
