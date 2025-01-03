extends AnimatableBody3D
class_name Chest

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

var status: bool = false

func _interact()-> void:
	if status:
		_close()
	else:
		_open()

func _open()-> void:
	status = true
	animPlayer.stop()
	animPlayer.play("Open")

func _close()-> void:
	status = false
	animPlayer.stop()
	animPlayer.play("Close")
