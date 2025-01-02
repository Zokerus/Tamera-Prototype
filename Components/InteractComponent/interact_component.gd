extends Node
class_name InteractComponent

signal interacted()

func interact_with()-> void:
	interacted.emit()
