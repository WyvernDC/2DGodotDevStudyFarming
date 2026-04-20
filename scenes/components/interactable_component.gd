class_name ImongMaInteract
extends Area2D

signal ImongMaInteract_activated 
signal ImongMaInteract_deactivated 

func _on_body_entered(body: Node2D) -> void:
	ImongMaInteract_activated.emit()


func _on_body_exited(body: Node2D) -> void:
	ImongMaInteract_deactivated.emit() 
