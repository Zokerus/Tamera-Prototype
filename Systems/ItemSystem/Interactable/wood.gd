extends RigidBody3D
class_name Interactable

@onready var highlight: MeshInstance3D = $MeshInstance3D/Highlight

func _interact()->void:
	self.queue_free()
