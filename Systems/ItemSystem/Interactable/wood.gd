extends RigidBody3D
class_name Interactable

@onready var highlight: MeshInstance3D = $MeshInstance3D/Highlight

func GetFocus() -> void:
	highlight.show()
	
func LoseFocus() -> void:
	highlight.hide()
