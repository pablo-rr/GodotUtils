class_name State, "res://Addons/StateMachine/state.png"
extends Node

signal entered(message)
signal exited

onready var state_machine : StateMachine = null

func handle_inpunt(event : InputEvent) -> void:
	pass

func process(delta : float) -> void:
	pass
	
func physics_process(delta : float) -> void:
	pass
	
func enter(message : Dictionary = {}) -> void:
	emit_signal("entered", [message])
	
func exit() -> void:
	emit_signal("exited")
